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
      course = Course.create(params)
    end
  end

  get '/courses/:course_subject' do
    @course = Course.find_by_slug(params[:course_subject])
    erb :'courses/show'
  end

end
