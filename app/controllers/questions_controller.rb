class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(questions_params)
    if @question.save
      redirect_to root_path, notice: "La pregunta se creo correctamente"
    else
      render :new
    end
  end

  def show
  end

  private
    def questions_params
      params.require(:question).permit(:title, :body)
    end
end
