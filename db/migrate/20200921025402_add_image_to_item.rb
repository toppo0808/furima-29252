class AddImageToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :image, :text
  end
end