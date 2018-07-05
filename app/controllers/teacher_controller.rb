class TeacherController < ApplicationController
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
