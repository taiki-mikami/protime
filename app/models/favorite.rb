class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :study_record, class_name: 'StudyRecord'
end
