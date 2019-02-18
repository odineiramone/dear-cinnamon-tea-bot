class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.integer :temperature, null: false
      t.integer :sensation,   null:false

      t.timestamps
    end
  end
end
