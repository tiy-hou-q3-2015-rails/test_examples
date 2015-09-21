require "test_helper"

class HomeListsAccountsTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Accounts"
  end

  test "home listed the accounts" do

    Account.create name: "JWo's Checking"
    Account.create name: "JWo's Savings"

    visit root_path
    assert_content page, "JWo's Checking"
    assert_content page, "JWo's Savings"

  end
end
