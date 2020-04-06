class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :studyrecord, class_name: 'StudyRecord'
end
