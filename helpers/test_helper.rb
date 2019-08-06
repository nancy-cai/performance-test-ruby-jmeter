module TestHelper

    def user_params(name, value, per_iteration = true )
      user_parameters names: [name],
          thread_values: {
            user_1: [value]
          },
          per_iteration: per_iteration
    end

    def random_pet_param(name)
      user_params(name, '${__RandomString(15,abcdefghijklmnopqrstuvwxyz,)}')
    end

    def formated_future_time(num, scale)
      future_time = Time.now + num
      case scale
      when "days"
        future_time = Time.now + num * 86400
      when "hours"
        future_time = Time.now + num * 3600
      when "minutes"
        future_time = Time.now + num * 60
      else
        future_time
      end

      return future_time.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
    end
end
