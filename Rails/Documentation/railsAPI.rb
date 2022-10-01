# RAILS USES THE MVC ARCHITECTURE.WHENEVER WE ARE USING THE RAILS API IN OUR FRONTEND, THE FOLLOWING STEEPS HAPPENS FOR OUR BACKEND. THE ENDPOINT IS MAPPED ONTO THE routes.rb FILE.ROUTES ARE FOUND IN THE config/routes.rb path. THE ROUTES FOLDER HAS THE ENDPOINTS AND EACH ENDPOINT IS MAPPED ONTO THE CONTROLLER.ThE CONTROLLER WHICH HAS MANY ACTIONS(in the form of functions) MAPS THE ROUTES TO THE ACTION. THE ACTION IS WHERE THE MAGIC LIES. HERE IS WHERE THE MAGIC HAPPENS. THE ACTIONS ARE METHODS THAT INTERACT WITH THE MODELS AND THE DATABASE. IT RETURNS JSON VALUES IF THE REQUEST WAS SUCCESSFULL AND ALSO RENDERS ERRORS IF THE REQUEST WAS UNSUCCESSFULL. 

# Installing rails
gem install rails

# creating a new rails app/api
rails new cheese-shop

                    # DIRECTORY FUNCTIONS.
app: #contains the Models, Views, and Controllers, along with the rest of the core functionality of the application.
config:# when you are setting up your application's routes i
db: # within the db directory you will find the database schema file that lists the database tables, their columns, and each column's associated data type.
Gemfile:# the Gemfile contains all of the gems that are included in the application; this is where you will place outside libraries that are utilized in the application
test:#Where tests are MAPPED

                    # RAILS GENERATORS
# This is where in rails as devs we don't have to spend our time worring about bellittle things but instead focus of the logic of our application.
rails g model Cheese name price:integer is_best_seller:boolean
# Code above sets for us a model Cheese and a migration for the model. The default value for the datatype is string.
rails g controller Cheeses
# Geneartor to generate the controller for the cheese model.Model names are always singular, and controller names are plural

# MIgration
class CreateCheeses < ActiveRecord::Migration[6.1]
    def change
      create_table :cheeses do |t|
        t.string :name
        t.integer :price
        t.boolean :is_best_seller
  
        t.timestamps
      end
    end
  end
  
# Model
class Cheese < ApplicationRecord
end
# Controller
class CheesesController < ApplicationController
end

# After the migration is set, we run the migration and seed data into it.
rails db:migrate
# Seed data
Cheese.create!(name: 'Cheddar', price: 3, is_best_seller: true)
Cheese.create!(name: 'Pepper Jack', price: 4, is_best_seller: true)
Cheese.create!(name: 'Limburger', price: 8, is_best_seller: false)

                    # STEEPS THAT HAPPEN WHEN A USER VISITS A RAILS APP.
# A client sends a request to the server (this could be: a user entering a URL in a browser; a JavaScript application using fetch; etc)
# That request is sent to the server where the application's router interprets the request and sends a message to the controller mapped to that route
# The controller uses the model to access data from the database
# The controller then uses that data to render a view (HTML or JSON)
# The server returns an HTTP response, which contains the HTML or JSON data

                    # CRUD OPERATIONS
#Often when working with the database/server eg Instagram, we often requests for posts,request for a specific post, send a new post, edit an existing or delete an existing post . This are what are termed as CRUD operations which entail the following.
# Rails router parses the requests and links to appropriate controller action.
GET/newsletters #The controller action is index and returns an array of all newsletters.
GET/newsletters/3 #The controller action is show and it returns an individual item.
POST/newsletters #The controller action used is create which returns the created newslwtter.
PUT || PATCH/newsletters/3 # Controller action is update and it returns the updated newsletter
DELETE/3 # The controller used is destroy it returns an empty response

# Controller/routes
Rails.application.routes.draw do
    resources :birds, only: [:index, :show, :create, :update, :destroy]
end
# custom routes
patch "/birds/:id/like", to: "birds#increment_likes"
# controller action
def increment_likes
    bird = Bird.find_by(id: params[:id])
    if bird
      bird.update(likes: bird.likes + 1)
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

                    #UNDERSDTANDING THE CONTROLLER CODES
# GET /birds/:id
def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end
  
  # PATCH /birds/:id
  def update
    bird = Bird.find_by(id: params[:id])
    if bird
      bird.update(bird_params)
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

#   The repetitive tasks of searching by id, happy part of code and error part can be refactored and hence our code will be much simpler and easier to read,
# First the find by will be replaced by the private method whose responsibility will be to search for the item
private

def find_bird
  Bird.find_by(id: params[:id])
end
# Find_by returns nil if the record isn't found in the database, which makes it useful for if/else control flow, since nil is a false-y value in Ruby.
# If we use the find to an external site. method instead, we'll get an ActiveRecord::RecordNotFound exception instead of nil when the record doesn't exist.
# The show function will be shortened as follows;
def show
    bird = find_bird
    render json: bird
  rescue ActiveRecord::RecordNotFound
    render_not_found_response
  end
#   This code can be further refactored by using the rescue_from method this way, if any of our controller actions throw an ActiveRecord::RecordNotFound exception, our render_not_found_response method will return the appropriate JSON response.
# As such the resulting controller will assume the following formart.
class BirdsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    # GET /birds
    def index
      birds = Bird.all
      render json: birds
    end
  
    # POST /birds
    def create
      bird = Bird.create(bird_params)
      render json: bird, status: :created
    end
  
    # GET /birds/:id
    def show
      bird = find_bird
      render json: bird
    end
  
    # PATCH /birds/:id
    def update
      bird = find_bird
      bird.update(bird_params)
      render json: bird
    end
  
    # PATCH /birds/:id/like
    def increment_likes
      bird = find_bird
      bird.update(likes: bird.likes + 1)
      render json: bird
    end
  
    # DELETE /birds/:id
    def destroy
      bird = find_bird
      bird.destroy
      head :no_content
    end
  
    private
  
    def find_bird
      Bird.find(params[:id])
    end
  
    def bird_params
      params.permit(:name, :species, :likes)
    end
  
    def render_not_found_response
      render json: { error: "Bird not found" }, status: :not_found
    end
  
  end
