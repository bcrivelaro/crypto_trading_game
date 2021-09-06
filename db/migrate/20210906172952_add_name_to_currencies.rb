# frozen_string_literal: true

class AddNameToCurrencies < ActiveRecord::Migration[6.1]
  def change
    add_column :currencies, :name, :string, null: false
  end
end
