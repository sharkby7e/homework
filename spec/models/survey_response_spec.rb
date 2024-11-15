require 'rails_helper'

RSpec.describe SurveyResponse, type: :model do
  it 'has a valid factory' do
    response = create(:survey_response)
    expect(response).to be_valid
  end

  it 'can be yes or no' do
    yes = create(:survey_response, answer: 0)
    no = create(:survey_response, answer: 1)

    expect(no.answer).to eq 'no'
    expect(yes.answer).to eq 'yes'
  end
end
