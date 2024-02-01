class CreateJobDescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :job_descriptions, id: :uuid do |t|
      t.text :description
      t.text :requirements
      t.string :job_classification
      t.integer :min_salary
      t.integer :max_salary
      t.references :job_application, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
