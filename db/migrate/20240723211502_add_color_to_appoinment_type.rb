class AddColorToAppoinmentType < ActiveRecord::Migration[7.1]
  def change
    add_column :appoinment_types, :color, :string, default: "#000000"
  end
end
