class QuestionsController < ApplicationController
    before_action :find_question, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :authenticate_user!, only: [:edit, :update, :destroy] # you need to be the owner to be able to delete question

    def new
      @question = Question.new
    end
  
    def create
      @question = Question.new question_params
      @question.user = current_user
        # changing to @questions so that it can be nay question and not creating a question
      if @question.save
        redirect_to question_path(@question.id)    #redirect_to root_path Before you made the 
      else
        render :new
      end
    end

    def index
        @questions = Question.all_with_answer_counts.order(created_at: :desc)
        # This will take all the questions and below will display in a json of all the questions that have been taken.
        # render json: @questions       STEP 5 *****
    end
    def show
        # @question = Question.find params[:id]
        @answers = @question.answers.order(created_at: :desc)
        @answer = Answer.new
        # render json: @question  TO TEST BEFORE USING  
        #STEP 6 ***** #This will show specific questions after the /questions in the local host
        # @question.view_count += 1
        # @question.save   These two lines will show the view count when it happens and when its updated.
        
        
        # the method `update_columns` workds just like `update`. However it will skil validations, skil
        # callbakcs and not update `updated_at`
        #unless you have a good reason to use DO NOT USE>
        @question.update_columns(view_count: @question.view_count + 1)
    end 

    def destroy
        # question = Question.find params[:id]
        
        @question.destroy
                                         # The controller for Destroy See Routes and show.html.erb
        redirect_to questions_path
    end

    def edit
        # @question = Question.find params[:id]  #this will allow you to edit the question refer back to Routes/ Must make a new 
                                                # edit.html.erb in questions in Views
    end

    def update
        # @question = Question.find params[:id]

        if @question.update question_params
            redirect_to question_path(@question.id)
        else
            render :edit
        end
    end
    
    private
    def question_params
      # Use the `require` on the params object to retrieve
      # the nested hash of a key usually corresponding the name-value
      # pairs of a form.
  
      # Then, use `permit` to specify all input names that are allowed
      # as symbols.
      params.require(:question).permit(:title, :body)
    end

    def find_question
        @question = Question.find params[:id]
  end
  def authorize_user!
    # We add a ! to the name of this method as a convention, because
    # it can mutate the `response` object of our controller.
    # Terminating permaturaly.
    unless can?(:crud, @question)
        flash[:danger] = "Access Denied"
        redirect_to question_path(@question) # this will redirect to the question path
    end
  end
  
end