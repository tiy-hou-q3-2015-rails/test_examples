class CalcsController < ApplicationController

  def show
    @calculation = Calculation.find_by people: params[:people]
  end


  def new
    @calculation = Calculation.new
  end

  def create
    @calculation = Calculation.new params.require(:calculation).permit(:people)
    @calculation.calculate
    if @calculation.save
      redirect_to calculation_path(people: @calculation.people)
    else
      render :new
    end
  end
end
