class CreateJoinTableCharacterStarship < ActiveRecord::Migration[6.1]
  def change
    create_join_table :characters, :starships do |t|
      # t.index [:character_id, :starship_id]
      # t.index [:starship_id, :character_id]
    end
  end
end
