class NotifyUserJob < ApplicationJob
  queue_as :default

  def perform(order)
    ActionCable.server.broadcast "user_order_channel#{order.user_id}", order: order, for: 'customer'
  end
end
