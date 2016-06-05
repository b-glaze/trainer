class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :trainer_id
      t.datetime :time
      t.timestamps null: false
    end
  end
end
