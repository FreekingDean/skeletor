class HomeController < ApplicationController
  skip_before_action :verify_authenticated
end
