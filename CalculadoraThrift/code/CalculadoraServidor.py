import sys
sys.path.append("gen-py")
from calculadora import Calculadora 
from thrift.transport import TSocket
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer 
from thrift.transport import TTransport


#manejador de llamadas
class OperacionesHandler:

    def sumar(self, numero1, numero2):
        suma = numero1+numero2
        print("La suma fue: %d" % suma)
        return suma

    def restar(self, numero1, numero2):
        resta = numero1-numero2
        print("La resta fue: %d" % resta)
        return resta

    def multiplicar(self, numero1, numero2):
        multiplicacion = numero1*numero2
        print("La multiplicacion fue: %d" % multiplicacion)
        return multiplicacion
    
    def dividir(self, numero1, numero2):
        if numero2 == 0:
            print( "La divicion con 0 no se puede")
            return -1
        divicion = numero1/numero2
        print( "La divicion fue: %f" % divicion)
        return divicion

puerto = 9090
handler = OperacionesHandler()
procesador = Calculadora.Processor(handler)
transporte_serv = TSocket.TServerSocket(port=puerto)
transporte_fact = TTransport.TBufferedTransportFactory()
protocolo_fact = TBinaryProtocol.TBinaryProtocolFactory()

servidor = TServer.TSimpleServer(procesador, transporte_serv, transporte_fact, protocolo_fact)
print("Puerto: %s iniciado :D" % puerto)
servidor.serve()

