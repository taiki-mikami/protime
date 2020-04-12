class RankingController < ApplicationController
    before_action :require_user_logged_in
    
    def index
        @users = User.all
        @ranking = StudyRecord.select("study_records.user_id,sum(study_records.studytime) as study_sum").group("study_records.user_id").order("study_sum desc")
    end
end
