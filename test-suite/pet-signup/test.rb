def create_pets_test_plan(options)
  test do
    random_pet_param('randomPet')
    pets_csv

    threads count: options[:concurrency], ramp_time: options[:rampup], duration: options[:duration] do
      default_host
      default_think_time
      default_header

      throughput_controller name: 'create_pets_using_random_string_generater_50%',percent: 50 do
        post name: 'create pets', url: BASE_URL + '/pet', raw_body:
        '{
          "category": {
            "id": 0,
            "name": "string"
          },
          "name": "${randomPet}",
          "photoUrls": [
            "hoho"
          ],
          "tags": [
            {
              "id": 0,
              "name": "${randomPet}"
            }
          ],
          "status": "available"
        }' do
          extract name: 'id', regex: %q{"id":(-[^,]+)}
          assert matches: 200, test_field: 'Assertion.response_code'
        end

        throughput_controller name: 'get_pet_details_85%',percent: 85 do
          get name: 'get pet details', url: BASE_URL + '/pet/${id}'
        end
      end


      throughput_controller name: 'create_pets_using_csv_50%',percent: 50 do
        post name: 'create pets', url: BASE_URL + '/pet', raw_body:
        '{
          "category": {
            "id": 0,
            "name": "string"
          },
          "name": "${name}",
          "photoUrls": [
            "hoho"
          ],
          "tags": [
            {
              "id": 0,
              "name": "haha"
            }
          ],
          "status": "${status}"
        }' do
          assert json: '.name', value: '${name}'
        end
      end

    end

    default_report
  end
end

def run_test(options)
  options[:concurrency] = 10 unless options[:concurrency]
  options[:rampup] = 5 unless options[:rampup]
  options[:duration] = 10 unless options[:duration]

  create_pets_test_plan(options)
end
