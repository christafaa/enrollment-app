class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  get '/' do
    if session.has_key?(:user_id) && session[:user_type] == "teacher"
      teacher = Teacher.find(session[:user_id])
      redirect "/teachers/#{teacher.slug}"
    elsif session.has_key?(:user_id) && session[:user_type] == "student"
      student = Student.find(session[:user_id])
      redirect "/students/#{student.slug}"
    else
      erb :index
    end
  end

  get '/login' do
    if session.has_key?(:user_id) && session[:user_type] == "teacher"
      teacher = Teacher.find(session[:user_id])
      redirect "/teachers/#{teacher.slug}"
    elsif session.has_key?(:user_id) && session[:user_type] == "student"
      student = Student.find(session[:user_id])
      redirect "/students/#{student.slug}"
    else
      erb :login
    end
  end

  post '/login' do
    if params[:user_type] == "teacher"
      teacher = Teacher.find_by(username: params[:username])

      if teacher && teacher.authenticate(params[:password])
        session[:user_id] = teacher.id
        session[:user_type] = "teacher"
        redirect "/teachers/#{teacher.slug}"
      else
        flash[:message] = "Incorrect username or password."
        redirect '/login'
      end

    elsif params[:user_type] == "student"
      student = Student.find_by(username: params[:username])

      if student && student.authenticate(params[:password])
        session[:user_id] = student.id
        session[:user_type] = "student"
        redirect "/students/#{student.slug}"
      else
        flash[:message] = "Incorrect username or password."
        redirect '/login'
      end

    else
      flash[:message] = "Incorrect username or password."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
