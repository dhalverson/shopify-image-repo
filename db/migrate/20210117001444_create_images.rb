class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :url
      t.string :name
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
