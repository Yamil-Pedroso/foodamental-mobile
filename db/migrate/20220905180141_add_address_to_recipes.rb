class AddAddressToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :address, :string
  end
end
