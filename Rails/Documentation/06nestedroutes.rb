# Dynamic routes 
get '/dog_houses/:dog_house_id/reviews', to: 'dog_houses#reviews_index'
get '/dog_houses/:dog_house_id/reviews/:id', to: 'dog_houses#review'
# The implementation of this dynamic routes is as follows
def reviews_index
    dog_house = DogHouse.find(params[:dog_house_id])
    reviews = dog_house.reviews
    render json: reviews, include: :dog_house
  end

  def review
    review = Review.find(params[:id])
    render json: review, include: :dog_house
  end

# The disadvantage of nested routes is repeating ourselves out and lack of separaton of concern as such nested routes are introduced which implement the parent to child relationship model.
Rails.application.routes.draw do

    resources :dog_houses, only: [:show] do
      # nested resource for reviews
      resources :reviews, only: [:show, :index]
    end
  
    resources :reviews, only: [:show, :index, :create]
  end
#   This way the following route is produced.
Prefix            Verb  URI Pattern                                     Controller#Action
dog_house_reviews GET   /dog_houses/:dog_house_id/reviews(.:format)     reviews#index
 dog_house_review GET   /dog_houses/:dog_house_id/reviews/:id(.:format) reviews#show
        dog_house GET   /dog_houses/:id(.:format)                       dog_houses#show
          reviews GET   /reviews(.:format)                              reviews#index
                  POST  /reviews(.:format)                              reviews#create

 #   However, as a general rule, you should only nest resources one level deep and ensure that you are considering Separation of Concerns in your routing.
 def index
    if params[:dog_house_id]
      dog_house = DogHouse.find(params[:dog_house_id])
      reviews = dog_house.reviews
    else
      reviews = Review.all
    end
    render json: reviews, include: :dog_house
  end
#  The index action is the one that will have a condition while the show action will remain as it is beacause irregardless of the route, it will render the same information.
  # app/controllers/dog_houses_controller.rb
class DogHousesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    def show
      dog_house = DogHouse.find(params[:id])
      render json: dog_house
    end
  
    private
  
    def render_not_found_response
      render json: { error: "Dog house not found" }, status: :not_found
    end
#  Imagine if we also had comments on a review. This would be a perfectly fine use of nesting:

resources :reviews do
    resources :comments
  end