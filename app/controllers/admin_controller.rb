class AdminController < ApplicationController
  def index

  end

  def users
    @users=User.all.page(params[:page])
  end

  def apply_records
    @apply_records=ApplyRecord.all.page(params[:page]).order(:created_at=>:desc)
    a=params[:page].to_i
    if a==0
      @count=0
    else
      @count=(a-1)*10
    end
  end
end
