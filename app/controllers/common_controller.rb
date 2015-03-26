class CommonController < ApplicationController
  def index
  end


  def unhandled
    if current_user.job=="客服人员"
      apply_records = ApplyRecord.where(:user => current_user.username).page(params[:page]).order(:created_at=>:desc)
      @apply_records = apply_records.where.not(:state=>"证书签发完毕").page(params[:page]).order(:created_at=>:desc)
    elsif current_user.job=="作品库管员"
      @apply_records=ApplyRecord.where(:state => "申请通过").page(params[:page]).order(:created_at=>:desc)
    elsif current_user.job=="作品备案认证人员"
      @apply_records=ApplyRecord.where(:state =>["物品已入库","物品送往备案"] ).page(params[:page]).order(:created_at=>:desc)
    elsif current_user.job=="草拟与证书发送人员"
      @apply_records=ApplyRecord.where(:state => ["采样完毕","备案物品归还"]).page(params[:page]).order(:created_at=>:desc)
    end
    a=params[:page].to_i
    if a==0
      @count=0
    else
      @count=(a-1)*10
    end
  end

end
