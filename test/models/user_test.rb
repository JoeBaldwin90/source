require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Uer should not save when all fields are blank' do
    assert_equal User.new.save, false, 'User saved with blank fields'
  end

  test 'User should save if all required fields are full' do
    @user = users(:joe)

    assert_equal @user.save, true, 'User saved when some fields are empty'
  end

  test 'User should be able to save and subscribe on signup' do
    @user = users(:joe)

    assert_equal @user.save_and_subscribe, true, 'User could not save & subscribe with thier details'
  end

  test 'User should not save and subscribe with invalid subscription plan' do
    @user = users(:joe)
    @user.subscription_plan = 'fakeplan'

    assert_equal @user.save_and_subscribe, false, 'User saved and subscribed with invalud sub plan'
  end

  test 'We should not charge user if their card is declined' do
    @user = users(:milan)

    assert_equal @user.save_and_subscribe, false, 'User was created and subscribed even though they used a declined card'
    assert_equal @user.errors[:stripe_token], ['Your card was declined.'], "The card was declined, but didn't match expected error message"
  end

  test 'should report random error' do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
