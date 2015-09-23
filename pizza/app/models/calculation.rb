class Calculation < ActiveRecord::Base

  validates :people, numericality: true

  def calculate
    return if self.people.to_i <= 0
    partial_pizas = (people + 1) /  4.0
    self.pizzas = partial_pizas.ceil
  end
end
