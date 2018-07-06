class CourseController < ApplicationController

  get '/courses' do
    erb :'courses/index'
  end

  get '/courses/:course_subject' do
    @course = Course.find_by_slug(params[:course_subject])
    erb :'courses/show'
  end

end
