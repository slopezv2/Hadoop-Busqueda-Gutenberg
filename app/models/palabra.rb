class Palabra
  include Mongoid::Document
  field :palabra, type: String
  field :documentos, type: Array
  field :cantidad_busqueda, type: Integer
end
