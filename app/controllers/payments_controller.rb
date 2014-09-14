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

  respond_to do |format|
    if charge.paid
      format.html {}
      format.js   {}
      format.json { render json: @product, status: :created, location: @product }
    else
      format.html {}
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end
end

def test_page
respond_to do |format|
format.html { render text: "html!"}
format.json { render json: Product.first }
end
end

end
