class TeachersController < ApplicationController
    set :views, File.join(APP_ROOT,'app','views','teachers')

    get '/' do
        @teachers = Teacher.all
        erb :index 
    end

    get '/new' do 
        erb :new
    end

    get '/:id' do
        id = params[:id].to_i
        @teacher = Teacher.all[id]
        erb :show
    end

    post '/' do
        teacher = Teacher.new(teacher_params)
          teacher.save #metodo que guarda los registros
  
          redirect '/teachers'
    end
    
    def teacher_params
        params[:teacher]
    end
end    