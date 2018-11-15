class OrderChannel < ApplicationCable::Channel
  def subscribed
    if current_user.type == 'Staff'
      stream_from "staff_order_channel#{current_user.stall_id}"
    else
      stream_from "user_order_channel#{current_user.id}"
    end
  end
end
