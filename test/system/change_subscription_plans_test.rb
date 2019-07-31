require "application_system_test_case"

class ChangeSubscriptionPlansTest < ApplicationSystemTestCase

  test "upgrade account" do
    visit edit_account_path

    # Change subscription plan to pro
    find_by_id('user_subscription_plan').click
    choose('Pro - £19.99/month')
    click_on "Save"

    assert_selector "div.success", text: "Your account details have been updated"
  end

end
