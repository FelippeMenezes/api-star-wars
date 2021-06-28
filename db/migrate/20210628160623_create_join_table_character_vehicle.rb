class CreateJoinTableCharacterVehicle < ActiveRecord::Migration[6.1]
  def change
    create_join_table :characters, :vehicles do |t|
      # t.index [:character_id, :vehicle_id]
      # t.index [:vehicle_id, :character_id]
    end
  end
end
