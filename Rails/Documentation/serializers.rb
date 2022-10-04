# Serialization is the customization of the JSON that is gonna be returned. The previous method was to use only and exception
def show
    movie = Movie.find(params[:id])
    render json: movie.to_json(only: [:id, :title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director])
  end
  def show
    movie = Movie.find(params[:id])
    render json: movie.to_json(except: [:created_at, :updated_at])
  end
#   For nested resources this can bes cumbersome.
def show
    post = Post.find(params[:id])
    render json: post.to_json(only: [:title, :description, :id], include: [author: { only: [:name]}])
  end
#Rather than depending on the controller to determine how the data is returned, that task should be handled elsewhere. Enter ActiveModel::Serializer.First we'll need to install that bundle 
gem 'active_model_serializers'
rails g serializer movie
# The above generator generates an ActiveModel::Serializer for our Movie model. in the app/serializers directory.
class MovieSerializer < ActiveModel::Serializer
    attributes :id, :title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director
end
# We can also include custom method in our serializer
def summary
    "#{self.object.title} - #{self.object.description[0..49]}..."
end
# Explicit serialization