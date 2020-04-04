class CreateStudyRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :study_records do |t|
      t.string :language
      t.integer :studytime
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
