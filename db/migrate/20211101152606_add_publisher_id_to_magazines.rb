# frozen_string_literal: true

class AddPublisherIdToMagazines < ActiveRecord::Migration[6.1]
  def change
    add_reference :magazines, :publisher, foreign_key: true
    # add_column :magazines, :publisher, :string
    # add_column :magazines, :references, :string
  end
end
