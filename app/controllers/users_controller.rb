class UsersController < ApplicationController


  #lack of ruby/rails knoweldge coudln't import the passwords/name
  #from a config file :(
  http_basic_authenticate_with name: 'admin', password: 'secret',
    except: [:create]

  def index
    @users = Competition.find(params[:competition_id]).users.all
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @user=User.new(competition_id: params[:competition_id],
                      user: user_params[:user], email: user_params[:email])

    if @user.save
      redirect_to competition_path(@competition)
    else
      render 'competitions/show'
    end
  end


  def destroy
    @competition = Competition.find(params[:competition_id])
    @user = @competition.users.find(params[:id])
    @user.destroy
    redirect_to competition_users_path(@competition)
  end


  private
    def user_params
      params.require(:user).permit(:user,:email)
    end
end
