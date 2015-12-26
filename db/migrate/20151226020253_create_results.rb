class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :test, index: true, foreign_key: true
      t.string :path
      t.json :headers, default: {}
      t.json :body, default: {}
      t.json :params, default: {}
      t.text :info

      t.timestamps null: false
    end
  end
end
