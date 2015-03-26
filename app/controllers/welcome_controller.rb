class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      if User.count==1 && User.admin==nil
        @a=User.first
        @a.admin=true
        @a.save
        redirect_to :controller => "edit_user",:action => "edit",:name=>current_user.username
      elsif User.count>1 && current_user.job==nil
        redirect_to :controller => "edit_user",:action=>"edit",:name=>current_user.username
      else
        redirect_to :controller => "common",:action => "index",:name=>current_user.username
      end
    end
  end

  def about_us

  end

  def contact_us

  end
end
