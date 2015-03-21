class AdminController < ApplicationController
  def index

  end

  def users
    @users=User.all.page(params[:page])
  end

  def apply_records
    @apply_records=ApplyRecord.all.page(params[:page]).order(:created_at=>:desc)
  end
end
