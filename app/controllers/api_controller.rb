class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  rescue_from StandardError do |ex|
    render json: {errors: [ex]}
  end

  include ApiAuthentication
end
