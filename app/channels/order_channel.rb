class OrderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "order_channel#{current_user.id}"
  end
end
