class PaymentsController < ApplicationController

def create

  @amount = params[:amount]

  stripe_customer = Stripe::Customer.create(
  	:email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => stripe_customer.id,
    :amount      => (params[:amount].to_i)*100,
    :description => 'Medusa Customer',
    :currency    => 'EUR'
  )

  puts params.inspect

  params[:payment][:stripeToken] = charge.id
  @payment = Payment.new(params[:payment])

  respond_to do |format|
    if @payment.save
      format.html { redirect_to '/payments/create' }
      format.js   {}
      format.json { render json: @payment, status: :created, location: @payment }
    else
      format.html { render action: "new" }
      format.json { render json: @payment.errors, status: :unprocessable_entity }
    end
  end
end

end
