require 'rails_helper'

RSpec.describe SurveysController, type: :request do
  describe '#index' do
    it 'includes links to surveys' do
      survey = create(:survey)

      get surveys_path

      expect(response).to be_successful
      expect(response.body).to have_link survey.question, href: survey_path(survey)
    end
  end

  describe '#show' do
    let(:survey) { create(:survey) }

    it 'works' do
      get survey_path(survey)

      expect(response).to be_successful
    end

    it 'includes button to create a survey response' do
      get survey_path(survey)

      expect(response.body).to have_button 'Yes'
      expect(response.body).to have_button 'No'
    end
  end

  describe '#new' do
    it 'includes a form to make a new survey' do
      get new_survey_path

      expect(response.body).to have_field(:survey_question)
    end
  end

  describe '#create' do
    let(:params) do
      {
        survey: {
          question: 'yes or no?'
        }
      }
    end

    it 'creates a new survey' do
      expect do
        post surveys_path(params)
      end.to change { Survey.count }.by 1
    end
  end
end
