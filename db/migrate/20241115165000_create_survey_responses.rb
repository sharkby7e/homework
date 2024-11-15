class CreateSurveyResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_responses do |t|
      t.integer :survey_id, null: false
      t.integer :answer, default: 0

      t.timestamps
    end
  end
end
