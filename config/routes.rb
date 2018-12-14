Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # Question Related Routes

  # resource is singular rather than resources
  # Unlike resources, resource will create routes
  # that do CRUD operations on only one thing.
  # There will be no index route, and no route,
  # will have a ':id' wildcard. The controller
  # name must still be plural.

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  # `resources` method will generate all CRUD routes following
  # RESTful conventions for a resource. It will assument there is a
  # controller named after the first argument pluralized and PascalCased.
  # (i.e. :question => QuestionsController)

    resources :questions do
    # Routes written inside of a block passed
    # to a `resources` method will be pre-fixed
    # by a path corresponding to the passed in symbol.
    # In this case, all nested routes will be
    # prefixed with `/questions/:question_id`
    resources :answers, only: [:create, :destroy]

        # question_answers_path(<question-id>), question_answer_url(<question-id>)
    
    # question_
end


  # POST / questions/89/answers

    # get("/questions/new", to: "questions#new", as: :new_question) # First Step Creating the Routes to the controller
    # # new_question_path, new_question_url
    # post("/questions", to: "questions#create", as: :questions)   # First Step Creating the Routes to the controller
    # # questions_path, question_url
    # get("/questions", to: "questions#index") # you do not need to add a AS: becuase GET and POST are the same thing 
    # get("/questions/:id", to: "questions#show", as: :question)
    # #question_path(<id>), question_url(<id>) you must provide so rails knows what the url id is. STEP 6 ***
    # delete("/questions/:id", to: "questions#destroy") #This will destroy whats being deleted when pushed the DELETE Button Connected to SHOW.html.erb
    # get("/questions/:id/edit", to: "questions#edit", as: :edit_question) #Creating an Edit Route for editing
    # # edit_question_path(<id>), edit_question_url(<id>)
    # patch("/questions/:id", to: "questions#update")  #remember to change at the questions CONTROLLER AS WELL 

  # To create route, use methods named after HTTP
  # verbs. This includes: get, post, put, patch, delete, ect.

  # As a first argument, write the URL path as a string .
  # (e.g "/", "Hello,world", "/posts/:id", ect)

  # Then provide the named argument "to" with string describes
  # the controller method taht will be to create response 
  # to the client's request.

  #Example: 'to: "welcome#index"' directs the request to 
  # the 'welcome controller' s index public method 
  # to : "posts#show" direct teh request to a 
  # postscontroller  show methods
  get("/", to: "welcome#index", as: :root) # root will a prefix 

  # RZoutes in rails define methods named afrter the route path or the value given to the 
  # "as"argumnet
  # For the route above , the following methods are defined:
  # root_path # => "/"
  # root_url #=> "http://localhost:3000/"


  get("/contact_us", to: "welcome#contact")
  # contact_us_path => "/contact_us"
  #contact _us_url => "/contact_us/contact_us"


  # vs .express
  # router.get ("/contact_us", (req, res) => {...})
  post("/contact_us/process", 
  to: "welcome#process_contact",
  as: :process_contact
  )

  #process_contact_path => /contact_us/process
  # process_contact_url => http://localhost:3000/contact_us/process
  # to list all of your routes use command :
  # rails routes
end
