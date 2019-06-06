class User < ApplicationRecord

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :stripe_token, presence: true

  has_secure_password

  def save_and_subscribe
    # Check user is valid
    # Check stripe_token is valid
    # If ok, save customer to DB & add them to the plan they picked

    if self.valid?

      # Create a stripe customer
      customer = Stripe::Customer.create(
        source: self.stripe_token,
        description: self.email)

      # Create a subscription type
      subscription = Stripe::Subscription.create(
        customer: customer.id,
        items: [
          { plan: self.subscription_plan }
        ]
      )

      # Save Stripe's customer id response to User model
      self.stripe_customer = customer.id

      # Save Stripe's subscription id response to User model
      self.stripe_subscription = subscription.id

      # Save
      self.save
    else
      false
    end

  rescue Stripe:: CardError => e
    @message = e.json_body[:error][:message]

    self.errors.add(:stripe_token, @message)

    false
  end

end
