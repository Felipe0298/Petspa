class AddPetToAppoinment < ActiveRecord::Migration[7.1]
  def change
    add_reference :appoinments, :pet, foreign_key: true, type: :uuid
  end
end
