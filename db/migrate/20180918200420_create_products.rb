class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :upc, null: false
      t.string :title
      t.text :json_data
      t.text :image_url

      t.timestamps
    end

    add_index :products, :upc, unique: true
  end
end
