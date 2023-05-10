class CreateElements < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.string :element_type
      t.text :content
      t.integer :position
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
