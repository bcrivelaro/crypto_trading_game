class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :symbol, null: false, unique: true

      t.timestamps
    end
  end
end
