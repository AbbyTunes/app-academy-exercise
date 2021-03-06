# == Schema Information
#
# Table name: responses
#
#  id          :bigint           not null, primary key
#  user_id     :integer          not null
#  question_id :integer          not null
#  choice_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ApplicationRecord

    belongs_to :respondent,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id

    belongs_to :answer_choice,
        class_name: :AnswerChoice,
        primary_key: :id,
        foreign_key: :choice_id
end

