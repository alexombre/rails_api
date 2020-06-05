class AddUserAndPrivateToImage < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :user, index: true
    add_column :images, :private?, :boolean, default: false
  end
end
