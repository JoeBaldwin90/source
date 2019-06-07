require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase

  test "make sure valid user can log in" do
    visit new_session_path

    # Capybara
    fill_in 'Username', with: 'Joe'
    fill_in 'Password', with: 'User123'

    click_button 'Log in'

    assert_equal page.current_path, items_path
    assert_selector "div.success", text: "Logged in!"
  end

  test "make sure error message shows when log-in fails" do
    visit new_session_path

    # Capybara
    fill_in 'Username', with: 'wrongusername'
    fill_in 'Password', with: 'wrongpassword'

    click_button 'Log in'

    assert_equal page.current_path, session_path
    assert_selector "div.error", text: "Wrong username and/or password"
  end

end
