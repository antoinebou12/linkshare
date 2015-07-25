class UsersController < ApplicationController
before_action :set_user, only: [:show]
  def index
    if params[:search]
    @users = User.search(params[:search])
    else
    @users = User.all
    end
  end
    def show
        
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:link).permit(:name, :admin, :avatar, :password, :avatar_cache, :remove_avatar, :email )

    end
end