class OrderController < ApplicationController
  def index
    @o=current_user.orders.where(payment_id: nil).first
    
    @total = @o.get_total
  end

  def new
    @stallList = Stall.all
    @menuItems = MenuItem.all
    o = Order.new
    o.user = current_user
    o.payment = Payment.new
    o.save
  end
end
