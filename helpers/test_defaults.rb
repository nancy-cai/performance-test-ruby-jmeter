module TestDefaults
  BASE_URL = '/v2'.freeze
  TEST_DEFAULT_PATH = __dir__ + '/../helpers/test_defaults'
  TEST_HELPER_PATH = __dir__ + '/../helpers/test_helper'
  PETS_PATH = __dir__ + '/../test-data/pets.csv'

  def default_header(authentication = nil)
    headers = [
      { name: 'Content-Type', value: 'application/json;charset=UTF-8' }
    ]
    headers << { name: 'aithentication-token', value: authentication } if authentication
    header(headers)
  end

  def default_host
    defaults domain: 'petstore.swagger.io', protocol: 'https'
  end

  def default_think_time
    random_timer 1000, 3000
  end

  def default_report
    aggregate_graph name: 'graph'
    response_time_graph name: 'response time graph'
    view_results_tree name: 'results'
  end

  def default_flood_grid
    [
      {
        infrastructure: 'demand',
        instance_type: 'm5.xlarge',
        instance_quantity: 1,
        region: 'ap-southeast-2',
        stop_after: 6
      }
    ]
  end

  def default_flood_files
    [
      TEST_DEFAULT_PATH,
      TEST_HELPER_PATH,
      USERS_PATH,
    ]
  end

  def pets_csv
    csv_data_set_config filename: PETS_PATH, variableNames: 'name, status', ignoreFirstLine: true
  end
end
