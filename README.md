# Star Wars API <img src="https://cdn.worldvectorlogo.com/logos/star-wars-4.svg" width="50" height="50">
A comprehensive encyclopedia of the Star Wars universe that consumes the SWAPI (Star Wars API) to display characters, planets, movies, and more. Developed as part of the Le Wagon coding bootcamp journey.

## 🚀 Live Demo
[https://api-star-wars-pulsus.herokuapp.com/](https://api-star-wars-pulsus.herokuapp.com/)

## 📷 Preview
<img src="app/assets/images/carac.png" width="200"/> <img src="app/assets/images/planets.png" width="200"/> <img src="app/assets/images/signup.png" width="200"/>

## 🛠️ Technologies Used
*   **Ruby on Rails:** Backend framework for the application structure.
*   **HTML/CSS (Sass):** Structural foundation and custom styling.
*   **Bootstrap:** Responsive UI components and layout.
*   **Active Record:** ORM for data management and persistence.
*   **PostgreSQL:** Relational database.
*   **Yarn/JS:** Package management and interactivity.

## 📝 Features
*   **External API Integration:** The character model includes a method to fetch and sync data directly from [swapi.dev](https://swapi.dev/).
*   **Complex Relationships:** Management of associations between Characters, Planets, Films, Vehicles, and Starships.
*   **Responsive Interface:** Adaptive design for different devices using Bootstrap.
*   **Categorization:** Character organization by categories and home planets.

## 💾 Data Structure (Models)
Commands used to create the database structure:
*   `rails g model character name height mass birth_year`
*   `rails g model planet name`
*   `rails g model film title`
*   `rails g model vehicle name model`
*   `rails g model starship name model`
*   `rails g model category name`
*   `rails g migration AddPlanetToCharacters planet:references`
*   `rails g migration AddCateogryToCharacters category:references`
*   `rails g migration CreateJoinTableCharacterFilm character film`
*   `rails g migration CreateJoinTableCharacterVehicle character vehicle`
*   `rails g migration CreateJoinTableCharacterStarship character starship`

## 🕹️ How to Use
1.  **Install dependencies:**
    ```bash
    bundle install
    yarn install
    ```
2.  **Setup Database:**
    ```bash
    rails db:drop db:create db:migrate db:seed
    ```
3.  **Start the Server:**
    ```bash
    rails s
    ```

## 🧠 What I Learned
During this project development at Le Wagon, I reinforced my knowledge of:
*   **MVC Architecture:** Organizing business logic, routes, and views.
*   **API Consumption:** Handling external JSON data to populate local databases.
*   **N:N Associations:** Implementing join tables for complex data relationships.
*   **Deployment:** Configuring production environments and deploying to Heroku.

## 📄 Acknowledgments
*   Project generated with lewagon/rails-templates, created by the Le Wagon coding bootcamp team.

---
May the force be with you!
