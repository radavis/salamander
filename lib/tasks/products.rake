namespace :app do
  namespace :products do
    desc "Fetch product data from external API"
    task fetch_data: :environment do
      Product.where(json_data: nil).all.each do |product|
        print "Updating #{product}... "
        if product.fetch_data && product.save!
          puts "Title: #{product.title}. Product updated!"
        else
          puts "no data found."
        end
      end
    end
  end
end
