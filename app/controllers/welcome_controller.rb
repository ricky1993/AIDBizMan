class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to :controller => "apply_records",:action => "index"
    end
  end

  def about_us

  end

  def contact_us

  end
end
