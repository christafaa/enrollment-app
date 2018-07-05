class StudentController < ApplicationController
  get '/students/new' do
    erb :'students/new'
  end
end
