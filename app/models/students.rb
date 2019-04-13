class Student
    attr_accessor :nombre, :programa, :fecha_nacimiento, :correo

    def initialize(nombre, programa, fecha_nacimiento, correo)
        self.nombre = nombre
        self.programa = programa
        self.fecha_nacimiento = fecha_nacimiento
        self.correo = correo
    end

    def self.all
        [
            Student.new('Ruben','Diseño','12/12/1978','ruben@gmail.com'),
            Student.new('Godines','Petroleos','01/10/1988','godines@gmail.com'),
            Student.new('Jaime','Diseño','06/06/1978','jimmy@gmail.com'),
            Student.new('Chavo','ADSI','03/03/1977','chavo@gmail.com'),
            Student.new('Juan','Diseño','12/12/1968','Juan@gmail.com')

        ]
    end
end