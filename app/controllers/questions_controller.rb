class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)

    if params[:title].present?
      @questions = @questions.where("title ILIKE ?", "%#{params[:title]}%")
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question =  current_user.questions.create(questions_params)

    if @question.save
      redirect_to root_path, notice: "La pregunta se creo correctamente"
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
  end

  private
    def questions_params
      params.require(:question).permit(:title, :body)
    end
end
