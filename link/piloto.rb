require 'celluloid'

class Piloto
    include Celluloid
  
    def initialize(carro)
      @carro = carro.new_link
    end
  
    def pilotar
      @carro.async.rodando_na_estrada
    end
  
end