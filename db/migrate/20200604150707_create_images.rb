class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.binary :stream
      t.text :description
      t.string :extension

      t.timestamps
    end
  end
end
