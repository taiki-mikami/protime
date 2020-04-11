class RankingController < ApplicationController
    before_action :require_user_logged_in
    
    def index
        @user = User.all
        @study_records = StudyRecord.all
    end
end
