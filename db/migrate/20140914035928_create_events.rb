class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :value
      t.integer :web_app_id

      t.timestamps
    end
    add_index :events, :web_app_id
  end
end
