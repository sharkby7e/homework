class AddSurveyChoiceIdToSurveyResponses < ActiveRecord::Migration[7.1]
  def change
    add_reference(:survey_responses, :survey_choice)
  end
end
