class AddCityIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city_id, :integer
    add_foreign_key :cities, :users
  end
end
