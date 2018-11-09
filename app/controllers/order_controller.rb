class OrderController < ApplicationController
  def new
    @storeList = Store.all;
    @menuItems = MenuItem.all
    o = Order.new
    o.user = current_user
    o.payment = Payment.new
    o.save

    redirect_back fallback_location: root_path
  end
end
