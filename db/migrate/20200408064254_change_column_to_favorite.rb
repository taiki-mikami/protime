class ChangeColumnToFavorite < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :favorites, :study_records
    remove_index :favorites, :studyrecord_id
    remove_reference :favorites, :studyrecord
  end
end
