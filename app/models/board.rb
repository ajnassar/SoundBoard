class Board < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true

	has_many :board_sounds
	has_many :sounds, through: :board_sounds
end


# stock_prices_yesterday  = [10, 7, 5, 8, 11, 9, 2]
stock_prices_yesterday  = [5, 3, 2]

def best_profit(stock_prices)
  lowest_price = stock_prices[0]
  best_profit = 0
  stock_prices.each_with_index do |current_price, idx|
    if current_price < lowest_price
      lowest_price = price
    end

    current_profit = current_price - lowest_price
    if current_profit > best_profit
      best_profit = current_profit
    end
  end

  best_profit > 0 ? best_profit : 'No profits today!'
end