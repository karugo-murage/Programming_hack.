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



