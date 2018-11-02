class PaymentController < ApplicationController
  def create
    StripeService.new(User.first).make_payment(payment_params)

    redirect_back fallback_location: root_path
  end

  def create_card
  end

  private

  def payment_params
    params.permit(:stripeToken, :amt)
  end
end
