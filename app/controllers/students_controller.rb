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
        id = params[:id]
        @student = Student.find(id)
        erb :show
    end
   
    #recibe los datos del formulario
    post '/' do
        Student.create(student_params)
        

        redirect '/students'
    end

    delete '/:id' do
        Student.destroy(params[:id])

        redirect '/students'
    end

    get '/update' do
       
        erb :update
    end

    get '/' do
        Student.update(params)
        

        redirect '/students'
    end



    #devuelve los parametros del new.erb
    def student_params
      params[:student]
    end

   

end

