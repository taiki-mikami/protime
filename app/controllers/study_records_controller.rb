class StudyRecordsController < ApplicationController
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
  end
  
  private
  
  def study_record_params
    params.require(:study_record).permit(:language, :studytime, :content)
  end
end
