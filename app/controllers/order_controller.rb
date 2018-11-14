class OrderController < ApplicationController
  def index
    @o = current_user.orders.where(payment_id: nil).first
    @o = Order.new if !@o

    @total = @o ? @o.get_total : 0
  end
end
