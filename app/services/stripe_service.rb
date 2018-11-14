# frozen_string_literal: true
require 'stripe'

class StripeService
  Stripe.api_key = ENV['STRIPE_API_KEY']
  def initialize(user)
    @user = user
  end

  def make_payment(params)
    bill(params)
  end

  private

  def bill(params)
    amt = ((Order.find_by(hash_id: params[:order_id]).get_total).to_f*100).to_i

    begin
      Stripe::Charge.create(
        :amount => amt,
        :currency => "sgd",
        :source => params[:stripeToken], # obtained with Stripe.js
        :description => "Test for #{@user.email}"
      )

      { status: 'success', message: "Order placed! We'll notify you once your order is ready." }
    rescue Stripe::CardError => e
      { status: 'error', message: "Man, looks like that card isn't going to cut it." }
    rescue => e
      { status: 'error', message: "Something went wrong. Please try again." }
    end
  end
end
