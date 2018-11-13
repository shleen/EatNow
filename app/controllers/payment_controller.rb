class PaymentController < ApplicationController
  before_action :set_up_instance_variables, only: [:new, :create]

  def new; end

  def create
    res = StripeService.new(User.first).make_payment(payment_params)

    if res[:status] == 'success'
      payment = Payment.create(amt: @o.get_total)

      @o.update(completed: true, payment_id: payment.id)
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
end
