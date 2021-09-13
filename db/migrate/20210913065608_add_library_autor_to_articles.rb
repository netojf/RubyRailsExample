class AddLibraryAutorToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :library, null: true, foreign_key: true
    add_reference :articles, :autor, null: true, foreign_key: true
  end
end
