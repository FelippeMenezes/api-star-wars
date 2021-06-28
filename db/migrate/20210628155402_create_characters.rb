class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :height
      t.string :mass
      t.string :birth_year

      t.timestamps
    end
  end
end
