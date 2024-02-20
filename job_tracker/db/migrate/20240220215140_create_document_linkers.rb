class CreateDocumentLinkers < ActiveRecord::Migration[7.1]
  def change
    create_table :document_linkers, id: :uuid do |t|
      t.references :job_application, null: false, foreign_key: true, type: :uuid
      t.references :supporting_document, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
