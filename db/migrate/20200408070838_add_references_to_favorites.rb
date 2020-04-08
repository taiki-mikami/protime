class AddReferencesToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :study_record, foreign_key: true
  end
end
