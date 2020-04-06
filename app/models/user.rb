class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :studyrecords, class_name: 'StudyRecord'
    has_many :relationships
    has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
    has_many :followings, through: :relationships, source: :follow
    has_many :followers, through: :reverses_of_relationship, source: :user
    
    has_many :favorites
    has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'studyrecord_id'
    has_many :fav_records, through: :favorites, source: :studyrecord
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
        self.favorites.find_or_create_by(studyrecord_id: record.id)
    end
    
    def unlike(record)
        favorite = self.favorites.find_by(studyrecord_id: record.id)
        favorite.destroy if favorite
    end
    
    def like?(record)
        self.fav_records.include?(record)
    end
end
