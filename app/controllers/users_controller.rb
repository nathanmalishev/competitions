require 'json'

class UsersController < ApplicationController

  def create
    puts params
    @competition = Competition.find(params[:competition_id])
    @user=User.new(competition_id: params[:competition_id],
                      user: user_params[:user], email: user_params[:email])

    if @user.save
      redirect_to competition_path(@competition)
    else
      puts @user.errors.to_json
      render 'competitions/show'
    end
  end


  private
    def user_params
      params.require(:user).permit(:user,:email)
    end
end
