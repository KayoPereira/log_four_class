class LessonsController < ApplicationController
  def index
    @lessons = Lesson.where(professor_id: current_user.id)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.professor_id = current_user.id

    if @lesson.save
      redirect_to @lesson
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update(lesson_params)
      redirect_to @lesson
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:lesson_day, :discipline)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
