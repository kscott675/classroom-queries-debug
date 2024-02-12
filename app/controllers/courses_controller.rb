class CoursesController < ApplicationController
  def index
    @courses = Course.all.order(created_at: :desc)
    render(template: "courses/index")
  end

  def show
    the_id = params.fetch("path_id")
    @course = Course.find(the_id)

    render(template: "courses/show")
  end

  def create
    @course = Course.new
    @course.title = params.fetch("q_title")
    @course.term_offered = params.fetch("query_term")
    @course.department_id = params.fetch("query_department_id")
    if @course.valid?
      @course.save
      redirect_to("/courses", notice: "Course created successfully.")
    else
      redirect_to("/courses", alert: "Course failed to create successfully.")
    end
  end

  def update
    @course = Course.find(params.fetch("path_id"))

    course_params = {
      title: params.fetch("query_title"),
      term_offered: params.fetch("query_term_offered"),
      department_id: params.fetch("query_department_id"),
    }

    if @course.update(course_params)
      redirect_to("/courses/#{params[:path_id]}", notice: "Course updated successfully.")
    else
      redirect_to("/courses/#{params[:path_id]}", alert: "Course failed to update successfully.")
    end
  end

  def destroy
    @course = Course.find(params.fetch("path_id"))
    @course.destroy
    redirect_to("/courses", notice: "Course deleted successfully.")
  end
end
