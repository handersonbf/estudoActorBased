require 'celluloid'

class CarroDaMorte
  include Celluloid

  def initialize
    puts "CARRO DA MORTE"
  end

  def rodando_na_estrada
    raise StandardError, " esse vai da em morte....\n"
  end
end