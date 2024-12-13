class SurveyResponsesController < ApplicationController
  def create
    @survey_response = SurveyResponse.new(survey_response_params)

    @survey_response.save!
  end

  def survey_response_params
    params.require(:survey_response).permit(:survey_choice_id, :survey_id)
  end
end
