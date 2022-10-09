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
# Controller/routes
Rails.application.routes.draw do
    resources :birds, only: [:index, :show, :create, :update, :destroy]
end
# custom routes
patch "/birds/:id/like", to: "birds#increment_likes"

rails g resource Movie title year:integer length:integer director description poster_url category discount:boolean female_director:boolean --no-test-framework
# This command will:
# Generate a migration for creating a movies table with the specified attributes
# Generate a Movie model file
# Generate a MoviesController controller file
# Add resources :movies to the routes.rb file
# After this we can edit the routes if we don't need specific endpoints, the migrations too to countercheck the database attributes.

                  

# After the migration is set, we run the migration and seed data into it.
rails db:migrate
# Seed data
Cheese.create!(name: 'Cheddar', price: 3, is_best_seller: true)
Cheese.create!(name: 'Pepper Jack', price: 4, is_best_seller: true)
Cheese.create!(name: 'Limburger', price: 8, is_best_seller: false)
