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
# After the migration is set, we run the migration and seed data into it.
rails db:migrate
# Seed data
Cheese.create!(name: 'Cheddar', price: 3, is_best_seller: true)
Cheese.create!(name: 'Pepper Jack', price: 4, is_best_seller: true)
Cheese.create!(name: 'Limburger', price: 8, is_best_seller: false)