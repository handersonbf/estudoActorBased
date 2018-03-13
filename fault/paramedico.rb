require 'celluloid'
require_relative 'vitima'

class Paramedico
    include Celluloid

    def initialize
        p "Paramédico acionado e no local..."
        # @vitima = VitimaAcidentada.new_link
        @vitima = Celluloid::Actor[:vitima].new_link
        link @vitima
    end

    def acidentada(coisa)
        puts "Paramedico chega no local... para socorrer #{coisa}"
        @vitima.acidentada coisa
    end
end