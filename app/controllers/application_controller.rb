class ApplicationController < Sinatra::Base
  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  get "/bakeries" do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  # returns a single bakery as JSON with its baked goods nested in an array.
  get "/bakeries/:id" do
    # look up the game in the database using its ID
    bakery = Bakery.find(params[:id])
    # send a JSON-formatted response of just the baked goods
    bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    # get all the baked goods from the database (and call by_price method of it to get it sorted by price in descending order)
    baked_goods_sorted_by_descending_price = BakedGood.by_price
    baked_goods_sorted_by_descending_price.to_json
  end

  get "/baked_goods/most_expensive" do
    # returns the single most expensive baked good as JSON.
    most_expensive_baked_good = BakedGood.by_price.first
    most_expensive_baked_good.to_json
  end

end
