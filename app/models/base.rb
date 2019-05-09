module Storage
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
            headers = self.class.file_headers #capturamos los encabezados del csv
            collection = self.class.all #capturamos el contenido del csv????

            collection << self

            CSV.open(self.class.file_path, 'w') do |csv| #iteramos el archivo cada camo esta en el csv
                csv << headers    #adicionamos al csv el encabezado
                collection.each do |record| #iteramos todos los registros
                    values = headers.map do |header| #guardamos en values la coleccion que nos devuelve el .map
                        record.send(header)
                    end

                    csv << values #adicionamos al csv los datos del value
                end
            end
        end
        #Metodo que toma los encabezados del archivo, siempre es la linea 1 del archivo esta no puede estar vacia
        def self.file_headers
            CSV.open(file_path, &:readline)
        end

        def self.all
            CSV.foreach(file_path, headers: true).map { |item| new(item) }
        end

       
        #metodo que devuelve la ruta del archivo
        def self.file_path
            File.join(APP_ROOT,'db',"#{table_name}.csv")
        end  
        #metodo para cargar un archivo de texto
        def self.table_name
            raise("NotImplementedError")
        end
    end
end