class RenameBooksIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :books_id, :book_id
  end
end
