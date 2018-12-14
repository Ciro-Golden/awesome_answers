class WelcomeController < ApplicationController
    def index
        render :index
    end

    def contact
        # by default rails will always try to attemp to render a view named after the action 
        # in other words, rails will always render: <action-method-name>
        # fr this action rails wilk automatically ging to call render <
    end

    #In rails we call public methods of controllers
    # actions. Actions return responses to the client.

    # name of form as to be the name of method 

    def process_contact 
        # in rails all of express req.params, req.query, req.body are combined into the params object.
        
        # user "render json: <object> to inspect the object as json in ther browser much
        # like we did with " res.send() in express"

        # render json: params
        #vs js
        # res.send(..req.body, .. req.query, .. req.params)

        # in rails instance variables and the controller are accessible in the render views as well 
        # use them to pass values to your templates.
        
        @full_name = params[:full_name]
        @message = params[:message]
        @email = params[:email]
        render :thank_you 
    end
end

