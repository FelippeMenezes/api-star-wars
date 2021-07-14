# API Star Wars <img src="https://cdn.worldvectorlogo.com/logos/star-wars-4.svg" width="50" height="50">

https://api-star-wars-pulsus.herokuapp.com/

Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

⭐ MODELOS ⭐

rails g model character name height mass birth_year

rails g model planet name rails g model film title

rails g model vehicle name model 

rails g model starship name model 

rails g model category name 

rails g migration AddPlanetToCharacters planet:references 

rails g migration AddCateogryToCharacters category:references

rails g migration CreateJoinTableCharacterFilm character film 

rails g migration CreateJoinTableCharacterVehicle character vehicle 

rails g migration CreateJoinTableCharacterStarship character starship

O MODEL DE CHARACTERS POSSUI UM MÉTODO PARA ENVIAR UMA MENSAGEM COMPLETA ALIMENTASA ATRAVÈS DE BANCO DE DADOS ALIMENTADO PELA API https://swapi.dev/

RUN:

bundle

yarn

rails db:drop db:create db:migrate db:seed 🌱🌱🌱🌱🌱

https://api-star-wars-pulsus.herokuapp.com/
QUE A FORÇA ESTEJA COM VOCÊ!
