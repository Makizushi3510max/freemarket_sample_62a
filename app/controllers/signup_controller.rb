class SignupController < ApplicationController
  def index
  end

  def registration
    @user = User.new
  end

  def registration_validates
    session = user_params
    # binding.pry
    redirect_to registration_signup_index_path
  end

  def sms_authentication
  end

  def sms_authentication
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
    params.require(:user).permit(:nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :date_of_birth)
  end
end
