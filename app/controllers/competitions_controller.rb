class CompetitionsController < ApplicationController


  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def edit
    @competition = Competition.find(params[:id])
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

  def update
    @competition = Competition.find(params[:id])

    if @competition.update(competition_params)
      redirect_to @competition
    else
      render 'edit'
    end
  end

  def destroy
    @competition = Competition.find(params[:id])
    @competition.destroy
    redirect_to competitions_path
  end


  private
    def competition_params
      params.require(:competition).permit(:title,:description)
    end
end
