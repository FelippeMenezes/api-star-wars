class Character < ApplicationRecord
    belongs_to :planet
    has_and_belongs_to_many :films
    belongs_to :category
    has_and_belongs_to_many :vehicles
    has_and_belongs_to_many :starships
end
