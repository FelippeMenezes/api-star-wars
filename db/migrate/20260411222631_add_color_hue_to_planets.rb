class AddColorHueToPlanets < ActiveRecord::Migration[7.0]
  def change
    add_column :planets, :color_hue, :integer
  end
end
