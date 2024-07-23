class AddLocalToAppoinment < ActiveRecord::Migration[7.1]
  def change
    add_reference :appoinments, :local, foreign_key: true, type: :uuid
  end
end
