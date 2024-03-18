class AddPublishedPropertyToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :published, :boolean
  end
end
