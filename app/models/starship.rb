class Starship < ApplicationRecord
    has_and_belongs_to_many :characters
end
