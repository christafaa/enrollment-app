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

    if session[:user_id] == @teacher.id
      erb :'teachers/edit'
    else
      redirect '/'
    end
  end

  patch '/teachers/:slug' do
    teacher = Teacher.find_by_slug(params[:slug])
    teacher.name = params[:name] unless params[:name].empty?
    teacher.username = params[:username] unless params[:username].empty?
    teacher.password = params[:password] unless params[:password].empty?
    teacher.alma_mater = params[:alma_mater] unless params[:alma_mater].empty?
    teacher.years_experience = params[:years_experience] unless params[:years_experience].empty?
    teacher.save
    redirect "/teachers/#{teacher.slug}"
  end

end
