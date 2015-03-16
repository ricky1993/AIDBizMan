module ApplicationHelper

  require 'rubygems'
  require 'json'

  def json_to_hash(json)
    json_result = JSON.parse json
    return json_result
  end

  def count
    user=current_user
    messages=Message.where(:tousername => user.username)
    messages1=messages.where(:flag=>false).page(params[:page]).order(:created_at)
    return number=messages1.where(:mark=>false).count
  end

end
