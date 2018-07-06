class CourseController < ApplicationController

  get '/courses' do
    erb :'courses/index'
  end
  
end
