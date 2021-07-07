Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

MODELOS

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

RODAR AS MIGRATIONS

rails db:create db:migrate

PARA PREENCHER O BANCO DE DADOS NÃO CHAME O SEED DIRETAMENTE, USE O DB:RESET, PARA FORÇAR O BANCO DE DADOS PARA O ESTADO INICIAL COM IDS VAZIOS.

rails db:reset

O MODEL DE CHARACTERS POSSUI UM MÉTODO PARA ENVIAR UMA MENSAGEM COMPLETA ALIMENTASA ATRAVÈS DA API https://swapi.dev/

Ex.

Luke = Character.find(1) Luke.msg_expression = "Hello! My name is Luke Skywalker. I am Human, height 172 kg, was born in Tatooine in the year of 19BBYand already piloted CR90 corvetteand a X-34 landspeeder"
