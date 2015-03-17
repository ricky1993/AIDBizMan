class EditUserController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!
  def index
    @user=current_user
  end

  def edit
    @user=User.where(:username => params[:name]).first
  end



  def show
    job=["客服人员","作品库管员","作品备案认证人员","草拟与证书发送人员"]
    @user=User.where(:username => params[:user]).first
    unless params[:realname]==nil
      @user.realname=params[:realname]
    end
    unless params[:phonenumber]==nil
      @user.phonenumber=params[:phonenumber]
    end
    if  params[:job]!=nil
        @user.job=params[:job]
    end
    @user.save
  end

  def othershow
    @user=User.where(:username => params[:name]).first
  end

  def handle
    @user=User.where(:username => params[:name]).first
    if @user.job=="客服人员"
      @apply_records=ApplyRecord.where(:user => @user.username).page(params[:page])
    elsif @user.job=="作品库管员"
      @apply_records=ApplyRecord.where(:itemsave => @user.username).page(params[:page])
    elsif @user.job=="作品备案认证人员"
      @apply_records=ApplyRecord.where(:sample => @user.username).page(params[:page])
    elsif @user.job=="草拟与证书发送人员"
      @apply_records=ApplyRecord.where(:issue => @user.username).page(params[:page])
    end
  end


end
