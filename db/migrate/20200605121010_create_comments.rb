class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.timestamps
    end
    add_reference :comments, :user, index: true
    add_reference :comments, :image, index: true
  end
end
