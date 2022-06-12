class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

private 

def render_not_found_response
    render json: {error: "Not found"}, status: :not_found
end

def render_invalid_response(invalid)
    render json: {error: "#{invalid.record.errors.full_messages}"}, status: 422
end

end
