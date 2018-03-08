require 'celluloid'
require_relative 'reporter'
require_relative 'piloto'
require_relative 'ferrari'
require_relative 'carro_da_morte'

class Iniciar
  def initialize
    #reporter chega para assistir
    reporter = Celluloid::Actor[:reporter] = Reporter.new

    #piloto entra em cena com o carro da morte
    Celluloid::Actor[:piloto] = Piloto.new CarroDaMorte

    #reporter olha para o piloto (linked)
    reporter.link Celluloid::Actor[:piloto]

    #piloto comeca a andar, caso ele bata a reporter ficará sabendo(esta linkada)
    Celluloid::Actor[:piloto].async.pilotar

    sleep 1
    #um novo piloto entra em cena com um novo carro
    Celluloid::Actor[:piloto] = Piloto.new Ferrari

    #a reporter agora vigia o novo piloto
    # reporter.link Celluloid::Actor[:piloto]

    #piloto comeca a andar, caso ele bata a reporter ficará sabendo(esta linkada)
    Celluloid::Actor[:piloto].async.pilotar

    Celluloid::Actor[:piloto] = Piloto.new CarroDaMorte
    Celluloid::Actor[:piloto].async.pilotar
  end
end

Iniciar.new



