class ApplicationController < ActionController::Base
    include SessionsHelper
    
    private
    
    def require_user_logged_in
        unless logged_in?
            redirect_to root_url
        end
    end
    
    def counts(user)
        @count_followings = user.followings.count
        @count_followers = user.followers.count
        @count_likes = user.fav_records.count
    end
end
