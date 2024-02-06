FactoryBot.define do
  factory :job_application do
    job_title { "MyString" }
    status { "applied" }
    employer
  end
end
