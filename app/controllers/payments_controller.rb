class PaymentsController < ApplicationController

def create

  stripe_customer = Stripe::Customer.create(
  	:email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => stripe_customer.id,
    :amount      => params[:amount],
    :description => 'Medusa Customer',
    :currency    => 'EUR'
  )
end

end
