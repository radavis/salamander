class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name
      t.string :email
      t.string :api_key, null: false
      t.timestamps
    end

    add_index :users, [:uid, :provider], unique: true
  end
end
