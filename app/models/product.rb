class Product < ApplicationRecord
  validates :upc, presence: true
  validates :upc, uniqueness: true

  def data
    JSON.parse(json_data || "{}")
  end

  def fetch_data
    walmart_product = WalmartProduct.new(upc)
    return false unless walmart_product.found?
    self.title = walmart_product.title
    self.image_url = walmart_product.image_url
    self.json_data = walmart_product.json_text
    self
  end

  def short_title
    result = title.gsub(/\[.*?\]/, "")
    result = result.gsub(/\(.*?\)/, "")
    result.strip
  end

  def to_s
    "UPC: #{upc}, Title: #{title}"
  end
end
