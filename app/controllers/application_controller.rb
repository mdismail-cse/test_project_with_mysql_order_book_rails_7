class ApplicationController < ActionController::Base
    before_action :authenticate_stuff!
    before_action :user_current


    def user_current
        @profile = current_stuff

    end
end
