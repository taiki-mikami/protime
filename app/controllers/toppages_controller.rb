class ToppagesController < ApplicationController
  def index
    @study = StudyRecord.all.order(id: :desc).page(params[:page])
  end
end
