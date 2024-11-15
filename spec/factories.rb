FactoryBot.define do
  factory :survey do
    question { 'Are you okay?' }
  end

  factory :survey_response do
    association :survey
  end
end
