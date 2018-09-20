class WalmartProduct
  attr_reader(
    :data,
    :json_text,
    :upc
  )

  def initialize(upc)
    @upc = upc
    @json_text = response.body
    @data = JSON.parse(json_text).dig("items")&.first
  end

  def format
    data.dig("attributes", "format")
  end

  def found?
    response.code == "200"
  end

  def image_url
    data.dig("largeImage")
  end

  def title
    data.dig("name")
  end

  def response
    @_response ||= Net::HTTP.get_response(uri)
  end

  private

  def params
    {
      apiKey: ENV["WALMART_OPEN_API_KEY"],
      format: "json",
      upc: upc
    }
  end

  def uri
    result = URI("https://api.walmartlabs.com/v1/items")
    result.query = URI.encode_www_form(params)
    result
  end
end
