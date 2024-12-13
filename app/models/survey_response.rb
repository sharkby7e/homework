class SurveyResponse < ApplicationRecord
  enum :answer, %i[yes no]

  belongs_to :survey
  belongs_to :survey_choice
end
