namespace :app do
  namespace :products do
    desc "Fetch product data from external API"
    task fetch_data: :environment do
      Product.where(json_data: nil).all.each do |product|
        print "Updating #{product}... "

        walmart_product = WalmartProduct.new(product.upc)
        unless walmart_product.found?
          puts "data not found."
          next
        end

        product.title = walmart_product.title
        puts "Title: #{product.title}"
        product.image_url = walmart_product.image_url
        product.json_data = walmart_product.json_text
        product.save!
      end
    end
  end
end
