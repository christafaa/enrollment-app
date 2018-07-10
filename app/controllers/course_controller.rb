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
    if params[:subject].empty?
      redirect '/courses/new'
    else
      course = Course.new(params)
      course.teacher = Teacher.find(session[:user_id])
      course.save
      redirect '/courses'
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
    # problem here - needs to be the teacher of the course
    if session.has_key?(:user_id)
      @course = Course.find_by_slug(params[:course_subject])
      erb :'courses/edit'
    else
      redirect '/login'
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
