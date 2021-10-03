# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_in
      t.string :genre

      t.timestamps
    end
  end
end