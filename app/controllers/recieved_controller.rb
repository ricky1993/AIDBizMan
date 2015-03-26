class RecievedController < ApplicationController
  before_action :authenticate_user!

  def nav

  end

  def index
    @user=current_user
    messages=Message.where(:tousername => @user.username)
    @messages=messages.where(:flag=>false).page(params[:page]).order(:created_at)
    @number=@messages.where(:mark=>false).count
    a=params[:page].to_i
    if a==0
      @count=0
    else
      @count=(a-1)*10
    end
  end

  def show
    @message=Message.find(params[:id])
    @message.mark=true
    @message.save
  end

end
