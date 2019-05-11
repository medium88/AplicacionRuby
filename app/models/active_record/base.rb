module ActiveRecord
    class Base

        
        def initialize(params = {})
            params.each do |key, value|
                instance_variable_set("@#{key}",value) # metodo que toma una variable de instancia y la crea con su valor
                self.class.send(:define_method, key) do # :define_method crea un metodo para traer los valores
                    instance_variable_get("@#{key}")
                    
                end
            end    
        end
        #metodo para escribir sobre el archivo
        def save
         
        end
     
        def self.all
           
        end

     
        #metodo para cargar un archivo de texto
        def self.table_name
            raise("NotImplementedError")
        end
    end
end