class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @product = Product.find_by(id:1)
    @address = Address.where(user_id: current_user.id).first
    # binding.pry
    # cardテーブルからpayjpの顧客idを検索し取得
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:private_key]
    # 保管したカードI.D.でpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    customer = Payjp::Customer.retrieve(card.customer_id)
    @defaulte_card_infomation = customer.cards.retrieve(card.card_id)

    # カードブランド画像の取得
    case @defaulte_card_infomation.brand
    when "Visa"
      @card_img = "cards/visa.svg"
    when "JCB"
      @card_img = "cards/jcb.svg"
    when "American Express"
      @card_img = "cards/american-express.svg"
    when "MasterCard"
      @card_img = "cards/master-card.svg"
    when "Saison"
      @card_img = "cards/saison-card.svg"
    when "Discover"
      @card_img = "cards/discover.svg"
    when "Diners Club"
      @card_img = "cards/dinersclub.svg"
    end
    
  end

  def pay
    
  end

  def done
    
  end

end
