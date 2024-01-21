class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_enum :status, %i[applied rejected interview_scheduled second_round waiting_decision offered_job hired]

    create_table :job_applications, id: :uuid do |t|
      t.references :employer, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.enum :status, default: :applied, null: false, enum_type: "status"

      t.timestamps
    end
  end
end
