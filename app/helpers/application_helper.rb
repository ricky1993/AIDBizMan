module ApplicationHelper

  require 'rubygems'
  require 'json'


  def count
    user=current_user
    messages=Message.where(:tousername => user.username)
    messages1=messages.where(:flag=>false).page(params[:page]).order(:created_at)
    return number=messages1.where(:mark=>false).count
  end

  def count_sq_handle
    apply_records=ApplyRecord.where(:itemsave => current_user.username, :state =>["物品交接中" ,"物品已入库","物品送往备案","采样中","采样完毕"])
    return apply_records.count
  end

  def count_sq_finish
    apply_records=ApplyRecord.where(:state1=>"物品已出库")
    return apply_records.count
  end


  def count_sq
    apply_records=ApplyRecord.where(:state => "申请通过")
    return apply_records.count
  end

  def count_kc
    apply_records=ApplyRecord.where(:state =>["物品已入库","物品送往备案"] )
    return apply_records.count
  end

  def count_cy
    apply_records=ApplyRecord.where(:state => ["采样完毕","备案物品归还"])
    return apply_records.count
  end

end
