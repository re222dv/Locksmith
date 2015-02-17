module Locksmith
  module ApiHelper
    class InvalidKey < StandardError
    end

    def self.validate_key(key)
      application = Application.where(key: key).first

      raise InvalidKey if application.nil?
    end
  end
end
