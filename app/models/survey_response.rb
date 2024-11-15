class SurveyResponse < ApplicationRecord
  enum :answer, %i[yes no]

  belongs_to :survey
end
