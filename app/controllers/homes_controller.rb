class HomesController < ApplicationController
  def top
  end

  def answer
    @age = params[:age]
    @result = Home.accumulation(@age.to_i)
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
    params.permit(:age)
  end
end
