class NotifyUserJob < ApplicationJob
  queue_as :default

  def perform(order)
    ActionCable.server.broadcast "order_channel#{order.user_id}", order: order
  end
end
