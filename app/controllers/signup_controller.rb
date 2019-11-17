class SignupController < ApplicationController
  def index
  end

  def registration
    @user = User.new
  end

  def registration_validates
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:date_of_birth] = Date.new(
      user_params["date_of_birth(1i)"].to_i,
      user_params["date_of_birth(2i)"].to_i,
      user_params["date_of_birth(3i)"].to_i)
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    # binding.pry
    redirect_to sms_authentication_signup_index_path
    
  end

  def sms_authentication
    @user = User.new
  end

  def sms_authentication_validates
    session[:phone_number] = user_params[:phone_number]
    binding.pry
    redirect_to sms_confirmation_signup_index_pathexit
  end

  def sms_confirmation
  end

  def address
  end

  def creditcard
  end

  def done
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :date_of_birth, :phone_number)
  end
end
