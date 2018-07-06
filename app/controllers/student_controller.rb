class StudentController < ApplicationController

  get '/students' do
    erb :'students/index'
  end

  get '/students/new' do
    erb :'students/new'
  end

  get '/students/:student_name' do
    @student = Student.find_by_slug(params[:student_name])
    erb :'students/show'
  end

  post '/students' do
    if params[:name].empty? || params[:username].empty? || params[:password].empty?
      redirect '/students/new'
    else
      Student.create(params)
    end
  end

  get '/students/:slug/edit' do
    @student = Student.find_by_slug(params[:slug])

    if session[:user_id] == @student.id && session[:user_type] == "student"
      erb :'students/edit'
    else
      redirect "/students/#{@student.slug}"
    end
  end

  patch '/students/:slug' do
    student = Student.find_by_slug(params[:slug])
    student.name = params[:name] unless params[:name].empty?
    student.username = params[:username] unless params[:username].empty?
    student.password = params[:password] unless params[:password].empty?
    student.save
    redirect "/students/#{student.slug}"
  end

end
