class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_up_instance_variables

  def index
    if current_user.type == 'Staff'
      @orders = Order.all
      @order_items = []
      @orders.each do |o|
        items = []
        o.order_items.each do |oi|
          if oi.menu_item.stall_id == current_user.stall_id
            items.push(oi)
          end
        end
        @order_items.push(items)
      end
    end
  end

  private

  def set_up_instance_variables
    # Raspberry PI URL
    @RPI = "https://httpbin.org/post"
  end
end
