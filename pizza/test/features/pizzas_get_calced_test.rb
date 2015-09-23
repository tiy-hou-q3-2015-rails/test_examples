require "test_helper"

class PizzasGetCalcedTest < Capybara::Rails::TestCase
  test "can calculate for a pizza" do
    visit root_path

    fill_in "People", with: 4
    click_button "Calculate"

    assert_content page, "2 pizzas"

  end
end
