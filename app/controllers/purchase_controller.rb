class PurchaseController < ApplicationController

  require 'payjp'

  def index
    # cardテーブルからpayjpの顧客idを検索し取得
    card = Card.where(user_id: current_user.id).first
    
  end

  def pay
    
  end

  def done
    
  end

end
