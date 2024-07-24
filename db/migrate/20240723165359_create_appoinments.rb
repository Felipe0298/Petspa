class CreateAppoinments < ActiveRecord::Migration[7.1]
  def change
    create_table :appoinments, id: :uuid do |t|
      t.integer :status, default: 0
      t.references :appoinment_type, null: false, foreign_key: true, type: :uuid
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
