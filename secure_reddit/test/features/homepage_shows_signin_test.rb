require "test_helper"

class HomepageShowsSigninTest < Capybara::Rails::TestCase
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
end
