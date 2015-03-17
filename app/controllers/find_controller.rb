class FindController < ApplicationController
  before_action :authenticate_user!

  def findApply
    users=User.all
    apply_records=ApplyRecord.all
    unless params[:dingdanhao]==""
      apply_records=apply_records.where(:dingdanhao =>params[:dingdanhao] )
    end

    unless params[:personname]==""
      apply_records=apply_records.where(:personname => params[:personname])
    end

    unless params[:item]=='无'
      apply_records=apply_records.where(:item=>params[:item])
    end

    unless params[:personcategory]=='无'
      apply_records=apply_records.where(:personcategory=>params[:personcategory])
    end

    unless params[:state]=='无'
      apply_records=apply_records.where(:state=>params[:state])
    end

    start_time=Time.new(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    end_time=Time.new(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)

    if start_time!=end_time
      apply_records=apply_records.where("created_at >= :start_date AND created_at <= :end_date", {start_date: start_time, end_date: end_time})
    end

    @apply_records=apply_records.page(params[:page]).order(:created_at=>:desc)
    @users=users.page(params[:page]).order(:created_at=>:asc)

  end

end