require "test_helper"

class DepositAFiftyTest < Capybara::Rails::TestCase

  test "deposit fifty dollars" do
    Account.create name: "JWo's Checking"

    visit root_path

    click_link "New Transaction"
    select "JWo's Checking", from: 'Account'
    fill_in 'Amount', with: 50
    click_button "Create Transaction"

    assert_content page, "$50"


  end

end
