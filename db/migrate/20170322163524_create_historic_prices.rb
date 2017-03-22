class CreateHistoricPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :historic_prices do |t|
      t.references :products, foreign_key: true
      t.integer :priceold
      t.integer :pricelast
      t.datetime :change
    end
  end
end
