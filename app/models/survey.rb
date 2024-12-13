class Survey < ApplicationRecord
  has_many :survey_responses
  has_many :survey_choices
end
