class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_up_instance_variables

  def index
    get_order_items if current_user.type == 'Staff'
  end

  private

  def set_up_instance_variables
    # Raspberry PI URL
    @RPI = "https://httpbin.org/post"
  end

  def get_order_items
    @orders = Order.where(completed: false).order(created_at: :asc)
    @order_items = []
    @orders.each do |o|
      items = []
      o.order_items.each do |oi|
        if (oi.menu_item.stall_id == current_user.stall_id) && !oi.completed
          items.push(oi)
        end
      end
      @order_items.push(items) if !items.empty?
    end
  end
end
