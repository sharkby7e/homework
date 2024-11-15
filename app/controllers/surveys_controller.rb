class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
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
