class PaymentController < ApplicationController
  before_action :set_up_instance_variables, only: [:new, :create]

  def new; end

  def create
    res = StripeService.new(User.first).make_payment(payment_params)

    if res[:status] == 'success'
      payment = Payment.create(amt: @o.get_total)

      @o.update(completed: false, payment_id: payment.id)

      broadcast_new_order
    end

    flash["#{res[:status]}"] = res[:message]
    redirect_to root_path
  end

  def create_card
  end

  private

  def set_up_instance_variables
    @o = Order.find_by(hash_id: params[:order_id])
  end

  def payment_params
    params.permit(:stripeToken, :order_id)
  end

  def broadcast_new_order
    stalls = {}

    @o.order_items.each do |oi|
      if stalls[oi.menu_item.stall_id].nil?
        stalls[oi.menu_item.stall_id] = [oi]
      else
        stalls[oi.menu_item.stall_id].push oi
      end
    end

    stalls.each do |stall_id, items|
      RefreshOrderItemJob.perform_later(stall_id, items)
    end
  end
end
