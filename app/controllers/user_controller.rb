class UserController < ApplicationController
  before_action :require_login, except: [:create]
  def create


    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/shoe'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    @selling = Shoe.where('user_id = ?', params[:id]).where(sold: false)
    @sold = Shoe.where('user_id = ?', params[:id]).where(sold: true)
    @shoes = Purchase.where('user_id = ?', params[:id])
    @total = 0
    # puts @shoes
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
