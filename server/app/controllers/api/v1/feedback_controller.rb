class Api::V1::FeedbackController < Api::V1::ApiController

  def post_feedback
    authenticate_request
    post_feedback_params

    new_feedback = Feedback.create(post_feedback_params)
    if !new_feedback.save
      render json: {error: 'Unable to save new feedback', messages: @user.errors.full_messages, status: :precondition_failed},
             status: :precondition_failed and return
    end

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
    params.require(:feedback).permit(:safety, :cleanliness, :comfort, :info, :recommend)
  end


end

#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  image_url          :string           not null
#  view_count         :integer          default(0)
#  heart_count        :integer          default(0)
#  smirk_count        :integer          default(0)
#  fire_count         :integer          default(0)
#  created_ip_address :string           default("")
#  likes              :integer          default(0)
#  likes_needed       :integer          default(0)
#  flagged            :boolean          default(FALSE)
#  approved           :boolean          default(FALSE)
#  deleted            :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
