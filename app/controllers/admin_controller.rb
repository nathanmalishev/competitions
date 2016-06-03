class AdminController < ApplicationController


  def index
    @competitions = Competition.all
  end
end
