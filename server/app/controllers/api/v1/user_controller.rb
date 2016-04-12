class Api::V1::UserController < Api::V1::ApiController

  def login_user

    render json: {status: :ok, message: 'login success', user: User.first}, status: :ok
  end 

end