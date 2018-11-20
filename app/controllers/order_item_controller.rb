class OrderItemController < ApplicationController
  def completed
    oi = OrderItem.find(params[:order_item_id])
    oi.update(completed: true)

    oi.order.order_items.each do |i|
      if !i.completed
        puts i.attributes
        return
      end
    end
    oi.order.update(completed: true)

    NotifyUserJob.perform_later(oi.order)
  end

  def add_item
    @mi = MenuItem.find(params[:order_item_id])
    @oi = OrderItem.new
  end

  def create
    if current_user.orders.where(payment_id: nil).first
      o = current_user.orders.where(payment_id: nil).first
    else
      o = Order.new
      o.user = current_user
    end
    o.save

    oi = OrderItem.new
    oi.qty = order_item_params[:qty]
    oi.menu_item = MenuItem.find(order_item_params[:menu_item_id])
    oi.order = o

    if oi.save
      flash[:success] = "Order item added successfully!"
    else
      flash[:error] = "Something went wrong... Please try again..."
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    OrderItem.find(params[:id]).destroy
  end

  private

  def order_item_params
    params.require(:order_item).permit(:qty, :menu_item_id)
  end
end
