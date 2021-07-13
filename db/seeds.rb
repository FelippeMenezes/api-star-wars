# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'pry'

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
    url.scan(/\d/)[0].to_i
end

puts "Populating Films..."
open_api_model('films').each do | film |
    Film.create(title: film["title"])
end

puts "Populating Planets..."
open_api_model('planets').each do | planet |
    Planet.create(name: planet["name"])
end

puts "Populating Categories (Species)..."
open_api_model('species').each do | category |
    Category.create(name: category["name"])
end

puts "Populating Starships..."
open_api_model('starships').each do | starship |
    Starship.create(name: starship["name"], model: starship["model"])
end

puts "Populating Vehicles..."
open_api_model('vehicles').each do | vehicle |
    Vehicle.create(name: vehicle["name"], model: vehicle["model"])
end

puts "Populating Characters (People)..."
open_api_model('people').each do | person |
    # Character.create(name: person["name"], height: person["height"], mass: person["mass"], birth_year: person["birth_year"])
    character = Character.new
    character.name = person["name"]
    character.height = person["height"]
    character.mass = person["mass"]
    character.birth_year = person["birth_year"]
    character.planet = Planet.find(get_id(person["homeworld"]))
    if person["species"][0]
        character.category = Category.find(get_id(person["species"].first))
    else
        character.category = Category.find(1)
    end
    person["films"].each do | film |
        character.films << Film.find(get_id(film))
    end
    person["vehicles"].each do | vehicle |
        character.vehicles << Vehicle.find(get_id(vehicle))
    end
    person["starships"].each do | starship |
        character.starships << Starship.find(get_id(starship))
    end
    puts "Creating Character #{character.name}" if character.save
end
