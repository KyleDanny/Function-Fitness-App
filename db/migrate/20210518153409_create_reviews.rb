class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.boolean :recommend, default: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
