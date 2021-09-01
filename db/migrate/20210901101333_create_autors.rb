class CreateAutors < ActiveRecord::Migration[6.1]
  def change
    create_table :autors do |t|
      t.string :name
      t.string :cson

      t.timestamps
    end
  end
end
