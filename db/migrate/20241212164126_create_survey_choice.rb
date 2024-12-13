class CreateSurveyChoice < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_choices do |t|
      t.string :choice, null: false
      t.integer :survey_id, null: false

      t.timestamps
    end
  end
end
