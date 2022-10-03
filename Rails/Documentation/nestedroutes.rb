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