class Api::V1::FeedbackController < Api::V1::ApiController

  def post_feedback
    authenticate_request
    post_feedback_params

    email = params[:feedback][:email]

    if email.present?
      @user = User.where(email: email).first
    end

    if not @user.present?
      @user = User.first
    end

    new_feedback = Feedback.create(post_feedback_params)
    new_feedback.user_id = @user.id
    
    if !new_feedback.save
      render json: {error: 'Unable to save new feedback', messages: @user.errors.full_messages, status: :precondition_failed},
             status: :precondition_failed and return
    end

    @user.feedback << new_feedback

    render json: {status: :created, message: 'Feedback succesfully posted', feedback: new_feedback}, status: :created
  end

  def fetch_feedback
    authenticate_request 

    relevant_feedback = Array.new

    relevant_feedback = Feedback.all

    render json: {status: :ok, message: 'Feedback fetched', feedback: relevant_feedback}, status: :ok

    # return max_id for post table
  end
 

  private
  def post_feedback_params
    params.require(:feedback).permit(:email, :name, :safety, :cleanliness, :comfort, :friendliness, :beauty, :transportation, :latitude, :longitude, :info)
  end


end