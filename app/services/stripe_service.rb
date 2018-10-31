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
    Rails.logger.info "\n\n\n#{params[:amt]}\n\n\n"
    Stripe::Charge.create(
      :amount => ((params[:amt]).to_f*100).to_i,
      :currency => "sgd",
      :source => params[:stripeToken], # obtained with Stripe.js
      :description => "Test for #{@user.email}"
    )
  end
end
