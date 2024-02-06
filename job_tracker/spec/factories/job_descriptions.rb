FactoryBot.define do
  factory :job_description do
    description { "MyText" }
    requirements { "MyText" }
    job_classification { "MyString" }
    min_salary { 1 }
    max_salary { 1 }

    association :job_application
  end
end
