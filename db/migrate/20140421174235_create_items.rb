class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :age
      t.integer :price
      t.boolean :working_condition

    end
  end
end
