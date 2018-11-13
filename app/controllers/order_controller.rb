class OrderController < ApplicationController
  def new
    @stallList = Stall.all
    @menuItems = MenuItem.all
    o = Order.new
    o.user = current_user
    o.payment = Payment.new
    o.save
  end
end
