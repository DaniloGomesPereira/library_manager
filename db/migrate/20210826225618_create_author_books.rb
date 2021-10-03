# frozen_string_literal: true

class CreateAuthorBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :author_books do |t|
      t.references :author, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.boolean :main_author, default: true

      t.timestamps
    end
  end
end
