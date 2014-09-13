class CreateWebApps < ActiveRecord::Migration
  def change
    create_table :web_apps do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
      
    add_index :web_apps, :token, unique: true
  end
end
