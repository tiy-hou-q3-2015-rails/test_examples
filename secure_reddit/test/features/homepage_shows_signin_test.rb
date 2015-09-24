require "test_helper"

class HomepageShowsSigninTest < Capybara::Rails::TestCase

  test "user can signup and see list of links" do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", with: "new-super-fantastic@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Password Confirmation", with: "12345678"
    click_button "Sign Up"

    assert_content page, "Links"
    assert_content page, "Welcome to SecureReddit, new-super-fantastic@example.com"

  end

  test "visiting the homepage shows the signin form" do
    visit root_path
    assert_content page, "Please Sign In"
    refute_content page, "Links"
  end

  test "After signing in, We see list of photos" do

    User.create email: "the-email@example.org", password: "12345678"

    visit root_path
    fill_in "Email", with: "the-email@example.org"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Links"

  end

  test "After sign in you can sign out" do
    User.create email: "the-email@example.org", password: "12345678"

    visit root_path
    fill_in "Email", with: "the-email@example.org"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Links"

    click_link "Sign Out"
    assert_content page, "You are now signed out. Thank you come again"
    assert_content page, "Please Sign In"
    refute_content page, "Links"
  end

  test "During signup, when password confirmation is wrong" do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", with: "new-super-fantastic@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Password Confirmation", with: "87654321"
    click_button "Sign Up"

    within(".user_password_confirmation") do
      assert_content page, "doesn't match Password"
    end
    refute_content page, "Links"

  end
end
