class MypagesController < ApplicationController

  def show
    
  end

  def profile
    
  end

  def card
    
  end

  def card_registration
    @card = Card.new
  end

  def creditcard_validates
    Payjp.api_key = Rails.application.credentials.payjp[:private_key]
    # binding.pry
    if params['payjp-token'].blank?
      # binding.pry
      redirect_to action: "card_registration"
    else
      customer = Payjp::Customer.create(
        description: '登録テスト',
        email: "test@test.com",
        card: params['payjp-token']
      )
      @card = Card.create(
        user:             current_user,
        customer_id:      customer.id,
        card_id:          customer.default_card
      )
      redirect_to purchase_index_path
    end
  end

  def identification
    
  end

  def logout
    
  end

  def creditcard_params
    params.require(:card).permit(:payment_card_no, :payment_card_security_code, :expiration_date)
  end


end
