# VALIDATIONS.
# They are done at the model directory in the class. The purpose of validation is to ensure that we are saving the right datatype in our database.
# Validation are done when CREATING and UPDATING records in the database.Delete and get requests are not subject to validations
# LENGTH VALIDATION.
validates :name, length: { minimum: 2 }
  validates :bio, length: { maximum: 500 }
  validates :password, length: { in: 6..20 }
  validates :registration_number, length: { is: 6 }
# UNIQUENESS VALIDATION.
validates :email, uniqueness: true
# CUSTOM VALIDATION.
# This is done /accomplished using the validate keyword. It takes the format;
class Person
    validate :must_have_flatiron_email
  
    def must_have_flatiron_email
      unless email.match?(/flatironschool.com/)
        errors.add(:email, "We're only allowed to have people who work for the company in the database!")
      end
    end
  end
#  SENDING ERROR MESSAGE TO THE USER.
# This is done depending on the if, else statement or ActiveREcord resque.
# We can also get an array of nicely-formatted errors with the .full_messages method.
def create
    person = Person.create(person_params)
    if person.valid?
      render json: person, status: :created
    else
      render json: { errors: person.errors.full_messages }, status: :unprocessable_entity
    end
  end
# If you're a fan of using rescue for control flow instead of if/else, you can use the ActiveRecord::RecordInvalid exception class along with create! or update!
  def create
    person = Person.create!(person_params)
    render json: person, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
#In postman if the newly created or updated value does not pass validation tests then the hash will not contain any id.
class BirdsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # added rescue_from
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
    # rest of controller actions...
    def update
        bird = find_bird
        bird.update!(bird_params)
        render json: bird
      end
  
    private
  
    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
  
    # rest of private methods...
  end
#   With this our controller can now focus on the happy part.