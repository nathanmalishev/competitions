class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      redirect_to competitions_path
    else
      render 'new'
    end
  end



  private
    def competition_params
      params.require(:competition).permit(:title,:description)
    end
end
