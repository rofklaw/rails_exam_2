class ShoeController < ApplicationController
  before_action :require_login

  def index
    @user = session[:user_id]
    @shoes = Shoe.where(sold: false)
    puts @shoes
  end

  def update
    @user = User.find(session[:user_id])
    @shoe = Shoe.find(params[:id])
    @purchase = Purchase.new(user: @user, shoe: @shoe)
    if @purchase.save
      @shoe.update(sold: true)
      redirect_to :back
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end

  end

  def create
    @user = User.find(session[:user_id])
    @shoe = Shoe.new(name: params[:name], cost: params[:cost], user: @user)
    if @shoe.save
      redirect_to '/shoe'
    else
      flash[:errors] = @shoe.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Shoe.find(params[:id]).destroy
    redirect_to :back
  end
end
