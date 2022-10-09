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
# We also add the relationships in our serialization. Do this only if you want to return the data belonging to the other table.
class DirectorSerializer < ActiveModel::Serializer
    attributes :id, :name, :birthplace, :female_director
  
    has_many :movies
  end
# To customize the JSON returned for a resource, create a serializer for that resource and list the desired attributes.
# The serializer is used implicitly by Rails based on naming conventions; to override this, custom serializers can be passed explicitly.
# AMS enables the use of the belongs_to and has_many macros in serializers to render associated data; these macros should be used sparingly.
# By default, AMS will only nest associations one level deep in the serialized JSON. To override this, the include option can be used