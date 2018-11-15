class RefreshOrderItemJob < ApplicationJob
  queue_as :default

  def perform(stall_id, items)
    ActionCable.server.broadcast "staff_order_channel#{stall_id}", items: items, for: 'staff'
  end
end
