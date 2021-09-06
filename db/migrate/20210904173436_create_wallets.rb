# frozen_string_literal: true

class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets, id: :uuid do |t|
      t.references :cycle, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
