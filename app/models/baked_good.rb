class BakedGood < ActiveRecord::Base
  belongs_to :bakery

  def self.by_price
    # sorted by price in descending order
    # binding.pry
    self.order(price: :desc)
  end
end
