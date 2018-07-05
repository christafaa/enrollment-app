class TeacherController < ApplicationController
  get '/teachers/new' do
    erb :'teachers/new'
  end
end
