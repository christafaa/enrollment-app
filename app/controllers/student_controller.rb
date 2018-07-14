class StudentController < ApplicationController

  get '/students' do
    if session.has_key?(:user_id)
      erb :'students/index'
    else
      redirect '/login'
    end
  end

  get '/students/new' do
    erb :'students/new'
  end

  get '/students/:student_name' do
    if session.has_key?(:user_id)
      @student = Student.find_by_slug(params[:student_name])
      erb :'students/show'
    else
      redirect '/login'
    end
  end

  post '/students' do
    student = Student.create(params)
    if student.valid? && !student.name.split(" ").join("").empty? && !student.username.split(" ").join.empty?
      session[:user_id] = student.id
      session[:user_type] = "student"
      redirect "/students/#{student.slug}"
    else
      redirect '/students/new'
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

  get '/students/:slug/delete' do
    student = Student.find_by_slug(params[:slug])

    if session[:user_id] == student.id && session[:user_type] == "student"
      student.delete
      session.clear
      redirect '/'
    else
      redirect "/students/#{student.slug}"
    end
  end

end
