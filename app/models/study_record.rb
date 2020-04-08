class StudyRecord < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  validates :language, presence: true, length: { maximum: 10 }
  validates :studytime, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
