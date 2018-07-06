class StudentController < ApplicationController

  get '/students' do
    erb :'students/index'
  end

  get '/students/new' do
    erb :'students/new'
  end

  post '/students' do
    if params[:name].empty? || params[:username].empty? || params[:password].empty?
      redirect '/students/new'
    else
      Student.create(params)
    end
  end
  
end
