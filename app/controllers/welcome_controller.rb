class WelcomeController < ApplicationController

  def index
  end

  def busqueda
  end

  def cargarDB
    palabras = []
    archivos = []
    #ruta_archivo= "/home/hadoop/data_raw/indice.txt"
    ruta_archivo = "/home/hadoop/data_raw/prueba/salida.txt"
    File.open(ruta_archivo).each do |line|
      texto = line.split(' ')
      for i in 0..texto.length - 1
        texto[i] = texto[i].gsub('"', '')
        texto[i] = texto[i].gsub('[', '')
        texto[i] = texto[i].gsub(']', '')
        texto[i] = texto[i].gsub(',', '')
      end
       palabras.insert(-1,texto[0])
       archivos.insert(-1,texto[1..-1])
    end
    for i in 0..palabras.length-1
      palabra = Palabra.new
      palabra.palabra = palabras[i]
      palabra.documentos = archivos[i]
      palabra.save
    end
    render plain: Palabra.first 
  end
end
