class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :studyrecords, class_name: 'StudyRecord', dependent: :destroy
    has_many :relationships, dependent: :destroy
    has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
    has_many :followings, through: :relationships, source: :follow
    has_many :followers, through: :reverses_of_relationship, source: :user
    
    has_many :favorites, dependent: :destroy
    has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'study_record_id'
    has_many :fav_records, through: :favorites, source: :study_record
    has_many :reverses_of_fav_record, through: :reverses_of_favorite, source: :user
    
    def follow(other_user)
        unless self == other_user
        self.relationships.find_or_create_by(follow_id: other_user.id)
        end
    end
    
    def unfollow(other_user)
        relationship = self.relationships.find_by(follow_id: other_user.id)
        relationship.destroy if relationship
    end
    
    def following?(other_user)
        self.followings.include?(other_user)
    end
    
    def like(record)
        self.favorites.find_or_create_by(study_record_id: record.id)
    end
    
    def unlike(record)
        favorite = self.favorites.find_by(study_record_id: record.id)
        favorite.destroy if favorite
    end
    
    def like?(record)
        self.fav_records.include?(record)
    end
    
    def studyrecords_followings
        StudyRecord.where(user_id: self.following_ids)
    end
    
    def studyrecords_followers
        StudyRecord.where(user_id: self.follower_ids)
    end
end
