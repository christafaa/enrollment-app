class CourseController < ApplicationController

  get '/courses' do
    if session.has_key?(:user_id)
      erb :'courses/index'
    else
      redirect '/login'
    end
  end

  get '/courses/new' do
    if session[:user_type] == "teacher"
      erb :'courses/new'
    else
      redirect '/courses'
    end
  end

  post '/courses' do
    course = Course.new(params)
    if course.subject.split(" ").join("").empty?
      flash[:message] = "Error: Subject cannot be blank."
      redirect '/courses/new'
    elsif course.valid?
      course.teacher = Teacher.find(session[:user_id])
      course.save
      redirect '/courses'
    else
      flash[:message] = "Error: Invalid input."
      redirect '/courses/new'
    end
  end

  get '/courses/:course_subject' do
    if session.has_key?(:user_id)
      @course = Course.find_by_slug(params[:course_subject])
      erb :'courses/show'
    else
      redirect '/login'
    end
  end

  get '/courses/:course_subject/delete' do
    course = Course.find_by_slug(params[:course_subject])
    if session[:user_type] == "teacher" && course.teacher.id == session[:user_id]
      course.delete
      redirect '/courses'
    else
      redirect "/courses/#{course.slug}"
    end
  end

  get '/courses/:course_subject/edit' do
    @course = Course.find_by_slug(params[:course_subject])
    if session.has_key?(:user_id) && session[:user_type] == "teacher" && !@course.teacher.nil? && @course.teacher.id == session[:user_id]
      erb :'courses/edit'
    else
      redirect "/courses/#{@course.slug}"
    end
  end

  patch '/courses/:course_subject' do
    course = Course.find_by_slug(params[:course_subject])
    course.subject = params[:subject] unless params[:subject].empty?
    course.day = params[:day] unless params[:day].empty?
    course.save
    redirect "/courses/#{course.slug}"
  end

  get '/courses/:course_subject/join' do
    if session[:user_type] == "student"
      student = Student.find(session[:user_id])
      course = Course.find_by_slug(params[:course_subject])
      course.students << student
      redirect "/courses/#{course.slug}"
    else
      redirect "/courses/#{course.slug}"
    end
  end

  get '/courses/:course_subject/leave' do
    if session[:user_type] == "student"
      student = Student.find(session[:user_id])
      course = Course.find_by_slug(params[:course_subject])
      course.students.delete(student)
      redirect "/courses/#{course.slug}"
    else
      redirect "/courses/#{course.slug}"
    end
  end

end
