# se encarga de mapear todos los modelos, los controladores y las vistas del proyecto
require_relative "boot.rb"


# cuando pasamos students como parametro a la url se activa StudentsController
map ("/students") { run StudentsController}
map ("/teachers") { run TeachersController}