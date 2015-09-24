require "test_helper"

class ShowingLinksTest < Capybara::Rails::TestCase

  test "If I follow Brian, his links should show" do
    me = User.create email: "me@example.com", password: "12345678"
    brian = User.create email: "brian@example.com", password: "12345678"
    brian.links.create url: "http://the-first-url.com"
    brian.links.create url: "http://the-second-url.com"

    me.follow brian

    visit root_path
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "http://the-first-url.com"
    assert_content page, "http://the-second-url.com"

  end

  test "If I do not follow Brian, his links should not show" do
    me = User.create email: "me@example.com", password: "12345678"
    brian = User.create email: "brian@example.com", password: "12345678"
    brian.links.create url: "http://the-first-url.com"
    brian.links.create url: "http://the-second-url.com"

    me.follow brian

    visit root_path
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    me.stop_following brian
    visit root_path

    refute_content page, "http://the-first-url.com"
    refute_content page, "http://the-second-url.com"
  end

end
