class RankingController < ApplicationController
    def index
        @user = User.all
        @study_records = StudyRecord.all
    end
end
