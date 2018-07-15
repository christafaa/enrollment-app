class TeacherController < ApplicationController

  get '/teachers' do
    if session.has_key?(:user_id)
      erb :'teachers/index'
    else
      redirect '/login'
    end
  end

  get '/teachers/new' do
    erb :'teachers/new'
  end

  get '/teachers/:teacher_name' do
    if session.has_key?(:user_id)
      @teacher = Teacher.find_by_slug(params[:teacher_name])
      erb :'teachers/show'
    else
      redirect '/login'
    end
  end

  post '/teachers' do
    teacher = Teacher.new(params)
    if teacher.name.split(" ").join("").empty?
      flash[:message] = "Error: Full Name cannot be blank."
    elsif teacher.username.split(" ").join("").empty?
      flash[:message] = "Error: Username cannot be blank."
    elsif !teacher.valid?
      flash[:message] = "Error: Invalid input."
    else
      teacher.save
      session[:user_id] = teacher.id
      session[:user_type] = "teacher"
      redirect "/teachers/#{teacher.slug}"
    end
    redirect '/teachers/new'
  end

  get '/teachers/:slug/edit' do
    @teacher = Teacher.find_by_slug(params[:slug])

    if session[:user_id] == @teacher.id && session[:user_type] == "teacher"
      erb :'teachers/edit'
    else
      redirect "/teachers/#{@teacher.slug}"
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

  get '/teachers/:slug/delete' do
    teacher = Teacher.find_by_slug(params[:slug])

    if session[:user_id] == teacher.id && session[:user_type] == "teacher"
      teacher.delete
      session.clear
      redirect '/'
    else
      redirect "/teachers/#{teacher.slug}"
    end
  end

end
