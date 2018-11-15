class RefreshOrderItemJob < ApplicationJob
  queue_as :default

  def perform(oi)
    ActionCable.server.broadcast "staff_order_channel#{oi.menu_item.stall_id}", orderI_item: oi
  end
end
