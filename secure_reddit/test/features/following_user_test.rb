require "test_helper"

class FollowingUserTest < Capybara::Rails::TestCase

  test "If I am following Brian, I can unfollow" do

    me = User.create email: "me@example.com", password: "12345678"
    brian = User.create email: "brian@example.com", password: "12345678"
    brian.links.create url: "http://the-first-url.com"
    brian.links.create url: "http://the-second-url.com"

    me.follow brian

    visit root_path
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link "Stop Following brian@example.com"

    assert_content page, "You have stopped following brian@example.com"
    assert_equal false, me.following?(brian)

  end

  test "I can follow Brian" do
    me = User.create email: "me@example.com", password: "12345678"
    brian = User.create email: "brian@example.com", password: "12345678"
    brian.links.create url: "http://the-first-url.com"
    brian.links.create url: "http://the-second-url.com"

    visit root_path
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link "Follow brian@example.com"

    assert_content page, "You have followed brian@example.com"
    assert_equal true, me.following?(brian)

  end
end
