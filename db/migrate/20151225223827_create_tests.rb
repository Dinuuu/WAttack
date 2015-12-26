class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :concurrent_users
      t.integer :duration
      t.string :path
      t.references :project, index: true, foreign_key: true
      t.json :headers, default: {}
      t.json :params, default: {}
      t.json :body, default: {}

      t.timestamps null: false
    end
  end
end
