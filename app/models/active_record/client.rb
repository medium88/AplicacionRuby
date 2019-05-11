require "pg"

module ActiveRecord
    class Client
        def  connection
            @connection ||=PG.connect(
                dbname: 'web_app',
                user: 'postgres',
                port: '9292',
                password: 'madridmedo88',
                host: 'localhost'
            )
        end

            def execute_query(query)
                connection.exec(query).values

            end    
        
    end
end