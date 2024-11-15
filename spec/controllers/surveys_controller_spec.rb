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
end
