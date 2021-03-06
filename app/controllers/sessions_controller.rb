class SessionsController < ApplicationController

  def create
    @study = StudyRecord.all.order(id: :desc).page(params[:page])
    email = params[:session][:email].downcase
    password = params[:session][:password].downcase
    if login(email, password)
      flash[:success] = 'ログインしました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render template: "toppages/index"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
