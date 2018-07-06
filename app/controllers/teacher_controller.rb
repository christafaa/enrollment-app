class TeacherController < ApplicationController

  get '/teachers' do
    erb :'teachers/index'
  end

  get '/teachers/new' do
    erb :'teachers/new'
  end

  get '/teachers/:teacher_name' do
    @teacher = Teacher.find_by_slug(params[:teacher_name])
    erb :'teachers/show'
  end

  post '/teachers' do
    if params[:name].empty? || params[:username].empty? || params[:password].empty?
      redirect '/teachers/new'
    else
      Teacher.create(params)
    end
  end

  get '/teachers/:slug/edit' do
    @teacher = Teacher.find_by_slug(params[:slug])
    erb :'teachers/edit'
  end

  patch '/teachers/:slug' do
    teacher = Teacher.find_by_slug(params[:slug])
    teacher.name = params[:name] unless params[:name].empty?
    teacher.username = params[:username] unless params[:username].empty?
    teacher.password = params[:password] unless params[:password].empty?
    teacher.save
    redirect "/teachers/#{teacher.slug}"
  end

end
