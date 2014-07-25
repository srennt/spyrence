Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_4Ry4kTY8cu0k3koeQpL0nlJS'],
  :secret_key      => ENV['sk_test_4Ry4nAXW5unovr7qrhRO5lFX']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
