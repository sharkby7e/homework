require 'rails_helper'

RSpec.describe SurveyResponsesController, type: :request do
  describe(:create) do
    let(:survey) { create(:survey) }

    let(:params) do
      {
        survey_response:
        {
          survey_id: survey.id,
          answer: 'no'
        }
      }
    end

    it 'creates a new survey response to the survey' do
      expect { post survey_responses_path(params) }.to change { survey.survey_responses.count }.by 1

      expect(survey.survey_responses.last.answer).to eq 'no'
    end
  end
end
