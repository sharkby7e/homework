class SurveyChoice < ApplicationRecord
  belongs_to :survey
  has_many :survey_responses
end
