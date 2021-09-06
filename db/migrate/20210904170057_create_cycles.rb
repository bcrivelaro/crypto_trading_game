# frozen_string_literal: true

class CreateCycles < ActiveRecord::Migration[6.1]
  def change
    create_table :cycles, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :mode, null: false
      t.boolean :current, null: false
      t.integer :points
      t.integer :order, null: false

      t.timestamps
    end
  end
end
