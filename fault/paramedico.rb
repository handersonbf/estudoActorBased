require 'celluloid'
require_relative 'vitima'

class Paramedico
    include Celluloid

    def initialize
        @vitima = Celluloid::Actor[:vitima]
        link @vitima
    end

    def acidentada(coisa)
        puts "Paramedico chega no local... para socorrer #{coisa}"
        @vitima.acidentada coisa
    end
end