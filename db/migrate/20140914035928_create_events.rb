class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :value
      t.integer :webapp_id

      t.timestamps
    end
    add_index :events, :webapp_id
  end
end
