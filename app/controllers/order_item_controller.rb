class OrderItemController < ApplicationController
  def completed
    oi = OrderItem.find(params[:order_item_id])
    oi.update(completed: true)

    oi.order.order_items.each do |i|
      if !i.completed
        puts i.attributes
        redirect_back fallback_location: root_path and return
      end
    end
    oi.order.update(completed: true)

    NotifyUserJob.perform_later(oi.order)
  end
end
