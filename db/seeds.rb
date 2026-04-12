# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

def open_api(url)
    puts "opening #{url}..."
    data_serialized = URI.open(url).read
    data = JSON.parse(data_serialized)
    return data
end

def open_api_model(model)
    url = "https://swapi.dev/api/#{model}/"
    data = open_api(url)
    results = data["results"]
    puts "found #{results.count} models..."
    while data["next"] do
        data = open_api(data["next"])
        data["results"].each do |result|
            results << result
        end
        puts "found #{results.count} models..."
    end
    return results
end

def get_id(url)
    return nil if url.blank?
    url.scan(/\d+/).last.to_i
end

puts "Populating Films..."
films_map = {}
open_api_model('films').each do | film |
    obj = Film.find_or_create_by!(title: film["title"])
    films_map[get_id(film["url"])] = obj
end

puts "Populating Planets..."
planets_map = {}
open_api_model('planets').each do | planet |
    obj = Planet.find_or_create_by!(name: planet["name"])
    planets_map[get_id(planet["url"])] = obj
end

puts "Populating Categories (Species)..."
categories_map = {}
open_api_model('species').each do | category |
    obj = Category.find_or_create_by!(name: category["name"])
    categories_map[get_id(category["url"])] = obj
end

puts "Populating Starships..."
starships_map = {}
open_api_model('starships').each do | starship |
    obj = Starship.find_or_create_by!(name: starship["name"], model: starship["model"])
    starships_map[get_id(starship["url"])] = obj
end

puts "Populating Vehicles..."
vehicles_map = {}
open_api_model('vehicles').each do | vehicle |
    obj = Vehicle.find_or_create_by!(name: vehicle["name"], model: vehicle["model"])
    vehicles_map[get_id(vehicle["url"])] = obj
end

puts "Populating Characters (People)..."
open_api_model('people').each do | person |
    character = Character.find_or_initialize_by(name: person["name"])
    character.height = person["height"]
    character.mass = person["mass"]
    character.birth_year = person["birth_year"]

    character.planet = planets_map[get_id(person["homeworld"])]

    species_id = get_id(person["species"]&.first)
    character.category = categories_map[species_id] || Category.first

    person["films"].each do | film |
        film_obj = films_map[get_id(film)]
        character.films << film_obj if film_obj && !character.films.include?(film_obj)
    end
    person["vehicles"].each do | vehicle |
        vehicle_obj = vehicles_map[get_id(vehicle)]
        character.vehicles << vehicle_obj if vehicle_obj && !character.vehicles.include?(vehicle_obj)
    end
    person["starships"].each do | starship |
        starship_obj = starships_map[get_id(starship)]
        character.starships << starship_obj if starship_obj && !character.starships.include?(starship_obj)
    end
    puts "Creating Character #{character.name}" if character.save
end
