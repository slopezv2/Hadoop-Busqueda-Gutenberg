class WelcomeController < ApplicationController
  def index
  end
  def busqueda
  end
  def cargarIndice
    completo = []
    ruta_archivo= "/home/sebastian/Documentos/Rails-Projects/Hadoop-Busqueda-Gutenberg/Pruebas-Conexion/Ejemplo"
    puts "Antes de file"
    File.open(ruta_archivo).each do |line|
      texto = line.scan(/"([\w]\S+)"/)
      texto.each do |parte|
        parte[0]= parte[0].tr_s('"', '')
      end
      completo += texto
    end
  end

  private
  def cargar_arreglo(arreglo)
    numero = 0
    arreglo.each do |componente|
      if numero % 2 != 0
        
      end
      numero++
    end
  end
end
