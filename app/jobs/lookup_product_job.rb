class LookupProductJob < ApplicationJob
  def perform(product)
    print "Updating #{product}... "
    if product.fetch_data && product.save!
      puts "Title: #{product.title}. Product updated!"
    else
      puts "no data found."
    end
  end
end
