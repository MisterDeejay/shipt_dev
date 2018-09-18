class ErrorPayload
  attr_reader :title, :status, :detail

  def initialize(title, status, detail)
    @title = title
    @status = status
    @detail = detail
  end

  def as_json(*)
    {
      status: Rack::Utils.status_code(status).to_s,
      title: title,
      detail: detail
    }
  end
end
