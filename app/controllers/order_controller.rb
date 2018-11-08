class OrderController < ApplicationController
  def new
    @storeList = Store.all;
    @menuItems = MenuItem.all
    o = Order.new

    o.price = rand(1..10)
    o.user = current_user

    o.save

    redirect_back fallback_location: root_path
  end
end
