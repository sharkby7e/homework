class SurveysController < ApplicationController
  def index
    @surveys = Survey.all

    survey_responses = SurveyResponse.group(:survey_id, :answer)
                                     .count

    @survey_responses = @surveys.each_with_object({}) do |survey, acc|
      total = survey_responses.select { |(survey_id, _), _| survey_id == survey.id }.values.sum

      yes_count = survey_responses[[survey.id, 'yes']] || 0
      no_count = survey_responses[[survey.id, 'no']] || 0

      acc[survey.id] = {
        yes: total > 0 ? ((yes_count / total.to_f) * 100).round : 0,
        no: total > 0 ? ((no_count / total.to_f) * 100).round : 0
      }
    end
  end

  def show
    @survey = Survey.find(params[:id])
    @survey_choices = @survey.survey_choices
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
