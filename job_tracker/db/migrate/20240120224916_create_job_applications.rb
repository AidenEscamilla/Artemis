class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications, id: :uuid do |t|
      t.references :employer, null: false, foreign_key: true, type: :uuid
      t.string :job_title
      t.string :status, default: 'applied', null: false

      t.timestamps
    end
  end
end
