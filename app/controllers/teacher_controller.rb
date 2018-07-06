class TeacherController < ApplicationController

  get '/teachers' do
    erb :'teachers/index'
  end

  get '/teachers/:teacher_name' do
    @teacher = Teacher.find_by_slug(params[:teacher_name])
    erb :'teachers/show'
  end

  get '/teachers/new' do
    erb :'teachers/new'
  end

  post '/teachers' do
    if params[:name].empty? || params[:username].empty? || params[:password].empty?
      redirect '/teachers/new'
    else
      Teacher.create(params)
    end
  end

end
