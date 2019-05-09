# se encarga de mapear todos los modelos, los controladores y las vistas del proyecto
require "sinatra"
require "csv"



APP_ROOT = File.dirname(__FILE__)


require_relative "app/controllers/application_controller"
require_relative "app/controllers/students_controller"
require_relative "app/controllers/teachers_controller"

require_relative "app/models/base"
require_relative "app/models/students"
require_relative "app/models/teacher"
# cuando pasamos students como parametro a la url se activa StudentsController
map ("/students") { run StudentsController}
map ("/teachers") { run TeachersController}