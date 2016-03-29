# == Schema Information
#
# Table name: feedbacks
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  safety      :integer
#  cleanliness :integer
#  comfort     :integer
#  info        :string
#  recommend   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Feedback < ActiveRecord::Base
end
