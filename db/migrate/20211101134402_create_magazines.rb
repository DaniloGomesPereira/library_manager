# frozen_string_literal: true

class CreateMagazines < ActiveRecord::Migration[6.1]
  def change
    create_table :magazines do |t|
      t.string :title
      t.date :published_in

      t.timestamps
    end
  end
end
