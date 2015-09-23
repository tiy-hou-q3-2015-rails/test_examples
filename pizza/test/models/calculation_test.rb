require 'test_helper'

class CalculationTest < ActiveSupport::TestCase

  test "none many person is none pizza" do
    calculation = Calculation.new people: 0
    calculation.calculate
    assert_equal 0, calculation.pizzas
  end

  test "one person is one pizza" do
    calculation = Calculation.new people: 1
    calculation.calculate
    assert_equal 1, calculation.pizzas
  end

  test "three people is one pizza" do
    calculation = Calculation.new people: 3
    calculation.calculate
    assert_equal 1, calculation.pizzas
  end

  test "four people is two pizzas" do
    calculation = Calculation.new people: 4
    calculation.calculate
    assert_equal 2, calculation.pizzas
  end

end
