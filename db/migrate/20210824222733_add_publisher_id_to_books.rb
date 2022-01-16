# frozen_string_literal: true

class AddPublisherIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :publisher, foreign_key: true
  end
end
