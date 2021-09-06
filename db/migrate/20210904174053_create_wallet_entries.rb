# frozen_string_literal: true

class CreateWalletEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :wallet_entries, id: :uuid do |t|
      t.references :wallet, null: false, foreign_key: true, type: :uuid
      t.references :currency, null: false, foreign_key: true, type: :uuid
      t.decimal :amount, null: false, precision: 30, scale: 20

      t.timestamps
    end
  end
end
