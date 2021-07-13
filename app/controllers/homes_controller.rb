class HomesController < ApplicationController

  def top
  end

  def answer
    @result = Home.accumulation(@age)
  end

  def about
  end

  def save
  end

  def investment
  end

  def trust
  end

  def stock
  end

  def asset
  end

  def nisa
  end

  def deposit
  end

  private

  def age_params
    params.require(:home).permit(:age)
  end

end
