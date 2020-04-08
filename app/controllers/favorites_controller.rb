class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    studyrecord = StudyRecord.find(params[:study_record_id])
    current_user.like(studyrecord)
    flash[:success] = 'いいね！しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    studyrecord = StudyRecord.find(params[:study_record_id])
    current_user.unlike(studyrecord)
    flash[:success] = 'いいね！を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
