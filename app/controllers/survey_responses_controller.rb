class SurveyResponsesController < ApplicationController
  def create
    @survey_response = SurveyResponse.new(survey_response_params)

    @survey_response.save!
  end

  def survey_response_params
    params.require(:survey_response).permit(:answer, :survey_id)
  end
end
