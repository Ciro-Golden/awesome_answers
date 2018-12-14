class AnswersController < ApplicationController
    before_action :find_answer, only: [:destroy]
    before_action :authenticate_user!
    before_action :authorize_user!, only: [:destroy]

    def create
        @question = Question.find params[:question_id]
        @answer = Answer.new answer_params
        @answer.question = @question
        @answer.user = current_user

        if @answer.save 
            redirect_to question_path(@question.id)
        else
            @answers = @question.answers.order(created_at: :desc)
            render "questions/show"  #rendering to the path 
       end
    end

    def destroy
       
        @answer.destroy
    
        redirect_to question_path(@answer.question)
      end
    
private

def answer_params
    params.require(:answer).permit(:body)
end

def find_answer
    @answer = Answer.find(params[:id])
  end

def authorize_user!
    unless can?(:crud, @answer)
      flash[:danger] = "Access Denied"
      redirect_to question_path(@answer.question)
    end
  end
end