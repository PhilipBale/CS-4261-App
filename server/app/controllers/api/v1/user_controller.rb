class Api::V1::UserController < Api::V1::ApiController

  def login_user
    email = params[:email]

    if email.present?
      @user = User.where(email: email).first
    end

    if not @user.present?
      @user = User.first
    end

    render json: {status: :ok, message: 'login success', user: @user}, status: :ok
  end 

end