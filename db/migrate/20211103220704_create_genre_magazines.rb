# frozen_string_literal: true

class CreateGenreMagazines < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_magazines do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :magazine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
