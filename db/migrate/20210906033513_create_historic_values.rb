class CreateHistoricValues < ActiveRecord::Migration[6.1]
  def change
    create_table :historic_values, id: :uuid do |t|
      t.decimal :usd, null: false, precision: 30, scale: 20
      t.decimal :btc, null: false, precision: 30, scale: 20
      t.datetime :value_at, null: false, default: -> { "now()" }
      t.uuid :valueable_id, null: false
      t.string :valueable_type, null: false

      t.timestamps
    end

    add_index :historic_values, [:valueable_type, :valueable_id]
  end
end
