class CreateEmployers < ActiveRecord::Migration[7.1]
  def change
    create_table :employers, id: :uuid do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.jsonb :address

      t.timestamps
    end
  end
end
