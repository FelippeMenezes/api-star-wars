class CreateJoinTableCharacterFilm < ActiveRecord::Migration[6.1]
  def change
    create_join_table :characters, :films do |t|
      # t.index [:character_id, :film_id]
      # t.index [:film_id, :character_id]
    end
  end
end
