class AddImageTo < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :image, :string
  end
end
