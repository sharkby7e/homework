class SurveysController < ApplicationController
  def index
    @surveys = Survey.all.includes(:survey_responses)

    @survey_responses = @surveys.each_with_object({}) do |survey, acc|
      total = survey.survey_responses.count
      acc[survey.id] = {
        yes: total > 0 ? ((survey.survey_responses.where(answer: 'yes').count / total.to_f) * 100).round : 0,
        no: total > 0 ? ((survey.survey_responses.where(answer: 'no').count / total.to_f) * 100).round : 0
      }
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to surveys_path, status: :see_other
    else
      render :new
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:question)
  end
end
