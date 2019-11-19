class SignupController < ApplicationController
  def index
  end

  def registration
    @user = User.new
  end

  def registration_validates
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:date_of_birth] = Date.new(
      user_params["date_of_birth(1i)"].to_i,
      user_params["date_of_birth(2i)"].to_i,
      user_params["date_of_birth(3i)"].to_i)
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    # binding.pry
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      date_of_birth: session[:date_of_birth],
      phone_number: "仮登録"
    )
    # binding.pry
    redirect_to sms_authentication_signup_index_path
  end

  def sms_authentication
    @user = User.new
  end

  def sms_authentication_validates
    session[:phone_number] = user_params[:phone_number]
    
    # binding.pry
    redirect_to sms_confirmation_signup_index_path
  end

  def sms_confirmation
    @user = User.new
  end

  def sms_confirmation_validates
    # binding.pry
    redirect_to address_signup_index_path
  end

  def address
    @address = Address.new
  end

  def address_validates
    session[:address_last_name] = address_params[:last_name]
    session[:address_first_name] = address_params[:first_name]
    session[:address_last_name_kana] = address_params[:last_name_kana]
    session[:address_first_name_kana] = address_params[:first_name_kana]
    session[:address_postal_code] = address_params[:postal_code]
    session[:address_prefecture] = address_params[:prefecture]
    session[:address_city_name] = address_params[:city_name]
    session[:address_block_number] = address_params[:block_number]
    session[:address_building_name] = address_params[:building_name]
    session[:address_phone_number] = address_params[:phone_number]
    # binding.pry
    redirect_to creditcard_signup_index_path
  end

  def creditcard
    @card = Card.new
    # binding.pry
  end

  def creditcard_validates
    # session[:]
    redirect_to done_signup_index_path
  end

  def done
    @user = User.create(
      nickname:         session[:nickname],
      password:         session[:password],
      email:            session[:email],
      date_of_birth:    session[:date_of_birth],
      last_name:        session[:last_name],
      first_name:       session[:first_name],
      last_name_kana:   session[:last_name_kana],
      first_name_kana:  session[:first_name_kana],
      phone_number:     session[:phone_number]
    )
    @address = Address.create(
      user:             @user,
      last_name:        session[:address_last_name],
      first_name:       session[:address_first_name],
      last_name_kana:   session[:address_last_name_kana],
      first_name_kana:  session[:address_first_name_kana],
      postal_code:      session[:address_postal_code],
      prefecture:       session[:address_prefecture],
      city_name:        session[:address_city_name],
      block_number:     session[:address_block_number],
      building_name:    session[:address_building_name],
      phone_number:     session[:address_phone_number]
    )
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :date_of_birth, :phone_number)
  end

  def address_params
    params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefecture, :city_name, :block_number, :building_name, :phone_number)
  end

  def creditcard_params
    params.require(:creditcard)
  end
end
