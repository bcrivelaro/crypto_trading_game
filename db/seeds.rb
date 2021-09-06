# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot'

puts "destroying all resources..."
WalletEntry.destroy_all
Currency.destroy_all
Wallet.destroy_all
Cycle.destroy_all
User.destroy_all

puts "creating currencies..."
usd = Currency.create!(symbol: 'USD')
btc = Currency.create!(symbol: 'BTC')
eth = Currency.create!(symbol: 'ETH')
ada = Currency.create!(symbol: 'ADA')
xrp = Currency.create!(symbol: 'XRP')

puts "creating users..."
users = FactoryBot.create_list :user, 10

puts "creating cycles and wallets..."
users.each do |user|
  cycle = user.cycles.create!(mode: :easy, current: true, points: nil, order: 1)
  wallet = Wallet.create!(cycle: cycle)
  wallet.wallet_entries.create!(currency: usd, amount: 10_000.to_f)
end


