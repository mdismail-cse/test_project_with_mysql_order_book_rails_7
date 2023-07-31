class ApplicationController < ActionController::Base
    before_action :authenticate_stuff!
end
