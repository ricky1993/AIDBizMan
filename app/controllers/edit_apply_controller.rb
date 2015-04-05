class EditApplyController < ApplicationController
  before_action :authenticate_user!

  def customer_service
    @apply_record = ApplyRecord.find(param[:id])
  end

  def storage
    @dingdanhao = params[:dingdanhao]
    @apply_record = ApplyRecord.where(:dingdanhao => params[:dingdanhao]).first
  end

  def sample
    @dingdanhao = params[:dingdanhao]
    @apply_record = ApplyRecord.where(:dingdanhao => params[:dingdanhao]).first
  end

  def issue
    @dingdanhao = params[:dingdanhao]
    @apply_record = ApplyRecord.where(:dingdanhao => params[:dingdanhao]).first
  end
end
