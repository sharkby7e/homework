require 'rails_helper'

RSpec.describe SurveysController, type: :request do
  describe "index" do
    it 'works' do
      get surveys_path

      expect(response).to be_successful
    end
  end
end
