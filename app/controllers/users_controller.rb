class UsersController < ApplicationController
  before_action :require_user_logged_in
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @study = @user.studyrecords.order(id: :desc).page(params[:page]).per(10)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザ登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(10)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(10)
    counts(@user)
  end
  
  def goodlists
    @user = User.find(params[:id])
    @goodlists = @user.fav_records.page(params[:page]).per(10)
    counts(@user)
  end
  
  def following_studies
    @study = current_user.studyrecords_followings.order(id: :desc).page(params[:page]).per(10)
  end
  
  def follower_studies
    @study = current_user.studyrecords_followers.order(id: :desc).page(params[:page]).per(10)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
