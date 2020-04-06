class FavoritesController < ApplicationController
  def create
    studyrecord = StudyRecord.find(params[:studyrecord_id])
    current_user.like(studyrecord)
    flash[:success] = 'いいね！しました。'
    redirect_to root_url
  end

  def destroy
    studyrecord = StudyRecord.find(params[:studyrecord_id])
    current_user.unlike(studyrecord)
    flash[:success] = 'いいね！を解除しました。'
    redirect_to root_url
  end
end
