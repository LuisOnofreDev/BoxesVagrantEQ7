$:.push('gen-rb') 

require 'thrift'
require 'calculadora'

puerto = 9090

transporte = Thrift::Socket.new('localhost', puerto)
transporte = Thrift::BufferedTransport.new(transporte)
protocolo = Thrift::BinaryProtocol.new(transporte)

cliente = Calculadora::Client.new(protocolo)

transporte.open()
bandera = 1
while bandera != 0
    begin
        puts "¿Qué deceas hacer? "
        puts "sumar-1      restar-2      multiplicar-3      dividir-4      salir-0: "
        bandera = gets
        bandera = bandera.to_i
        case bandera
            when 1
                puts "Ingrese el número 1: "
                numero1 = gets
                puts "Ingrese el número 2:"
                numero2 = gets
                suma = cliente.sumar(numero1.to_i, numero2.to_i)
                puts "El resultado de la suma es: #{suma}"
            when 2
                puts "Ingrese el número 1: "
                numero1 = gets
                puts "Ingrese el número 2:"
                numero2 = gets
                resta = cliente.restar(numero1.to_i, numero2.to_i)
                puts "El resultado de la resta es: #{resta}"
            when 3
                puts "Ingrese el número 1: "
                numero1 = gets
                puts "Ingrese el número 2:"
                numero2 = gets
                multiplicacion = cliente.multiplicar(numero1.to_i, numero2.to_i)
                puts "El resultado de la multiplicación es: #{multiplicacion}"
            when 4
                puts "Ingrese el número 1: "
                numero1 = gets
                puts "Ingrese el número 2:"
                numero2 = gets
                division = cliente.dividir(numero1.to_i, numero2.to_i)
                puts "El resultado de la división es: #{division}"
            when 0
                puts "¡HASTA LUEGO MARICARMEN!"
            else
                puts "Ingrese un número dentro del rango,"
        end
        rescue 
            puts "Ingrese un número válido."
    end
    
end

transporte.close()