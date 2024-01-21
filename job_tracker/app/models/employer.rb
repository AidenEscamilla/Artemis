class Employer < ApplicationRecord
    has_many :job_applications, dependent: :delete_all
end
