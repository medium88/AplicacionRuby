class StudentsController < ApplicationController
    set :views, File.join(APP_ROOT,'app','views','students')
    #GET /students/
    get "/" do
        @students = Student.all #llamamos al metodo all de la clase students
        erb :index
    end
    #get/student/new
    get '/new' do 
        erb :new
    end

    #GET /students/:id
    get "/:id" do
        id = params[:id].to_i
        @student = Student.all[id]
        erb :show
    end
    #recibe los datos del formulario
    post '/' do
      student = Student.new(student_params)
        student.save #metodo que guarda los registros

        redirect '/students'
    end
    #devuelve los parametros del new.erb
    def student_params
      params[:student]
    end

   

end

