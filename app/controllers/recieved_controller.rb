class RecievedController < ApplicationController
  def nav

  end

  def index
    @user=current_user
    messages=Message.where(:tousername => @user.username)
    @messages=messages.where(:flag=>false).page(params[:page]).order(:created_at)
    @number=@messages.where(:mark=>false).count
  end

  def show
    @message=Message.find(params[:id])
    @message.mark=true
    @message.save
  end

end
