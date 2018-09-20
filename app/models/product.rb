class Product < ApplicationRecord
  validates :upc, presence: true
  validates :upc, uniqueness: true

  def data
    JSON.parse(json_data)
  end

  def short_title
    result = title.gsub(/\[.*?\]/, "")
    result = result.gsub(/\(.*?\)/, "")
    result.strip
  end

  def to_s
    "Product ##{id}, UPC: #{upc}, Title: #{title}"
  end
end
