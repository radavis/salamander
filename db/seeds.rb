require "csv"

CSV.foreach("./db/upcs.csv") do |row|
  upc = row.first
  Product.find_or_create_by(upc: upc)
end
