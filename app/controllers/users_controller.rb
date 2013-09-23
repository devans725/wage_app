class UsersController < ApplicationController
  before_action :signed_in_user, only: [:download]
  #before_action :correct_user,   only: [:download]

  def show
    @user = User.find(params[:id])
    @wtwos = @user.wtwos
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Wage Portal!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def download
    @user = User.find(params[:id])
    @wtwos = @user.wtwos.select('path, year')
    
    @wtwos = @wtwos.where(year: params[:year])
    @wtwos = @wtwos.first
    
    @filename = "#{Rails.root}/#{@wtwos[:path]}"
    send_file @filename, :type => 'application/pdf', :filename => 'doc.pdf'
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
