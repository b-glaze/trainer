class DropDeviseTables < ActiveRecord::Migration
  def change
  	drop_table :trainers
  	drop_table :clients
  end
end
