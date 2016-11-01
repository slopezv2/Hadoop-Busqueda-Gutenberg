class WelcomeController < ApplicationController

  def index
    @top_busquedas = Palabra.order('cantidad_busqueda DESC').limit(5)
  end

  def busqueda
    palabras = "ejemplo"
    if params[:busqueda]
      palabras = params[:busqueda]
    end
    @palabras = palabras.downcase
    @textos = Palabra.find_by(palabra: palabras)
    if @textos
      if @textos.cantidad_busqueda
        @textos.cantidad_busqueda += 1
      else
        @textos.cantidad_busqueda = 1
      end
      @textos.save
    end
  end

  def descargar
    ruta = "/home/hadoop/data_raw/es/"
    archivo = params[:descargar]
    send_file ruta + archivo, :type => 'text/text; charset=utf-8', :filename => archivo 
  end

  def cargarDB
    palabras = []
    archivos = []
    ruta_archivo= "/home/hadoop/data_raw/indice.txt"
    #ruta_archivo = "/home/hadoop/data_raw/prueba/salida.txt"
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
    redirect_to root_url
  end
end
