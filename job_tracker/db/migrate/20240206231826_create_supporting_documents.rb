class CreateSupportingDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :supporting_documents, id: :uuid do |t|
      t.string :name
      t.references :job_application, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
