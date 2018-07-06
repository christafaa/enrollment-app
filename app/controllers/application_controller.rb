class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if params[:user_type] == "teacher"
      teacher = Teacher.find_by(username: params[:username])

      if teacher && teacher.authenticate(params[:password])
        session[:user_id] = teacher.id
        session[:user_type] = "teacher"
        redirect "/teachers/#{teacher.slug}"
      else
        redirect '/login'
      end

    elsif params[:user_type] == "student"
      student = Student.find_by(username: params[:username])

      if student && student.authenticate(params[:password])
        session[:user_id] = student.id
        session[:user_type] = "student"
        redirect "/students/#{student.slug}"
      else
        redirect '/login'
      end

    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
