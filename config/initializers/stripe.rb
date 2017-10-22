Rails.configuration.stripe = {
  :publishable_key => "pk_test_vpQRa6WLyPKagJboZZs0gYQI",
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
