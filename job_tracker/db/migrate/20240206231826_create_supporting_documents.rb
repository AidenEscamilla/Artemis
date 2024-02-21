class CreateSupportingDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :supporting_documents, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
