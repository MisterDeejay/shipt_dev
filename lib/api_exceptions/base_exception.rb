module ApiExceptions
  class BaseException < StandardError
    include ActiveModel::Serialization
    attr_reader :status, :detail

    ERROR_DESCRIPTION = Proc.new {|status, detail| {status: status, detail: detail}}
    ERROR_CODE_MAP = {
      "ProductError::InvalidDateRange" =>
        ERROR_DESCRIPTION.call(422, "Invalid input given for date range"),
      "ProductError::InvalidQuantity" =>
        ERROR_DESCRIPTION.call(422, "Invalid input given for quantity")
    }

    def initialize
      error_type = self.class.name.scan(/ApiExceptions::(.*)/).flatten.first
      ERROR_CODE_MAP.fetch(error_type, {}).each do |key, val|
        instance_variable_set("@#{key}".to_sym, val)
      end
    end
  end
end
