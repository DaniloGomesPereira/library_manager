class CreateGenreBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_books do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
