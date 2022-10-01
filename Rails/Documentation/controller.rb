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