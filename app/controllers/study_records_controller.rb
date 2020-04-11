class StudyRecordsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @study_record = StudyRecord.find(params[:id])
    @favorites = @study_record.favorites.where(study_record_id: @study_record.id)
  end
  
  def new
    if logged_in?
      @study_record = current_user.studyrecords.build
    end
  end

  def create
    @study_record = current_user.studyrecords.build(study_record_params)
    
    if @study_record.save
      flash[:success] = '記録しました。'
      redirect_to root_url
    else
      flash[:danger] = '記録に失敗しました。'
      render :new
    end
    
  end

  def destroy
    @study_record.destroy
    flash[:success] = '勉強記録を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def study_record_params
    params.require(:study_record).permit(:language, :studytime, :content)
  end
  
  def correct_user
    @study_record = current_user.studyrecords.find_by(id: params[:id])
    unless @study_record
      redirect_to root_url
    end
  end
  
end
