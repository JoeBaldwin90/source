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


  def update_with_stripe(form_params)

    # Update model with form_params
    # Check if valid
    # Update Model
    self.assign_attributes(form_params)

    if self.valid?
      # Find subscription type from stripe's response
      subscription = Stripe::Subscription.retrieve(self.stripe_subscription)

      # Get first item from subscription_plan
      item_id = subscription.items.data[0].id

      # Make new items list
      items = [
        { id: item_id, plan: self.subscription_plan }
      ]

      # Update sub with new items
      subscription.items = items

      # Save new subscription data to Stripe
      subscription.save

      # Update User model with new subscription data
      self.save
    else
      false
    end
  end

  def unsubscribe_and_destroy
    # Find subscription
    subscription = Stripe::Subscription.retrieve(self.stripe_subscription)

    # Delete subscription
    subscription.delete

    # Remove user completey
    self.destroy
  end

end
