# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :symbol, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
