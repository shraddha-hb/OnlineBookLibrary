module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    # rescue_from Mongoid::Errors::DocumentNotFound do |e|
    #   json_response({ message: e.message }, :not_found)
    # end
	  rescue_from Mongoid::Errors::DocumentNotFound,
	              BSON::InvalidObjectId do |e|
	    render json: {
	      errors: 'Not found.'
	    }, status: 404
	  end
  end

end