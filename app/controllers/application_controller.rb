class ApplicationController < ActionController::Base
    include SessionsHelper
    
    private
    
    def require_user_logged_in
        unless logged_in?
            redirect_to root_url
        end
    end
    
    def require_user_signup
        unless logged_in?
            redirect_to '/signup'
        end
    end
    
    def counts(user)
        @count_followings = user.followings.count
        @count_followers = user.followers.count
        @count_likes = user.fav_records.count
        @count_goods = user.reverses_of_fav_record.count
    end
    
end
