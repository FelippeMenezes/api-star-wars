require 'json'
require 'open-uri'

def open_api(url)
  puts "opening #{url}..."
  data_serialized = URI.open(url).read
  data = JSON.parse(data_serialized)
  data
end

def open_api_model(model)
  url = "https://swapi.dev/api/#{model}/"
  data = open_api(url)
  results = data["results"]
  puts "found #{results.count} models..."
  while data["next"]
    data = open_api(data["next"])
    data["results"].each { |result| results << result }
    puts "found #{results.count} models..."
  end
  results
end

def get_id(url)
  url.scan(/\d+/)[0].to_i
end

# FILMS
puts "Populating Films..."
open_api_model('films').each do |film|
  Film.find_or_create_by!(title: film["title"])
end

# PLANETS
puts "Populating Planets..."
planets_api_results = open_api_model('planets')
total_planets = planets_api_results.count
hues = (0...total_planets).map { |i| (i * 360 / [total_planets, 1].max).to_i }.shuffle

planets_api_results.each_with_index do |planet, index|
  p = Planet.find_or_initialize_by(name: planet["name"])
  p.color_hue = hues[index]
  p.save!
end

# CATEGORIES (Species)
puts "Populating Categories (Species)..."
open_api_model('species').each do |category|
  Category.find_or_create_by!(name: category["name"])
end


# STARSHIPS
puts "Populating Starships..."
open_api_model('starships').each do |starship|
  Starship.find_or_create_by!(name: starship["name"]) do |s|
    s.model = starship["model"]
  end
end

# VEHICLES
puts "Populating Vehicles..."
open_api_model('vehicles').each do |vehicle|
  Vehicle.find_or_create_by!(name: vehicle["name"]) do |v|
    v.model = vehicle["model"]
  end
end

# CHARACTERS (People)
puts "Populating Characters (People)..."
open_api_model('people').each do |person|
  character = Character.find_or_initialize_by(name: person["name"])

  character.height     = person["height"]
  character.mass       = person["mass"]
  character.birth_year = person["birth_year"]
  character.planet     = Planet.find_by!(name: Planet.find(get_id(person["homeworld"])).name)

  character.category = if person["species"][0]
    Category.find(get_id(person["species"].first))
  else
    Category.find(1)
  end

  film_ids = person["films"].map { |film| get_id(film) }
  character.films = Film.find(film_ids)

  vehicle_ids = person["vehicles"].map { |v| get_id(v) }
  character.vehicles = Vehicle.find(vehicle_ids)

  starship_ids = person["starships"].map { |s| get_id(s) }
  character.starships = Starship.find(starship_ids)

  puts "Saving Character #{character.name}..." if character.save
end

