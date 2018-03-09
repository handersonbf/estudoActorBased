require 'celluloid'
require_relative 'vitima'
require_relative 'vitima_acidentada'
require_relative 'paramedico'
require_relative 'hospital'
require_relative 'curioso'
class Iniciar
    include Celluloid
    
    def initialize
        simular_actor_crashed
    end

    def simular_actor_crashed
        p 'Vítima na cena...'
        Celluloid::Actor[:vitima] = Vitima.new
        p 'Paramédico foi chamado...'
        Celluloid::Actor[:paramedico] = Paramedico.new
        p 'O curioso chega...'
        Celluloid::Actor[:curioso] = Curioso.new
        p 'Hospital fica esperando dar merda...'
        Hospital.run!
        
        sleep 1
    
        Celluloid::Actor[:vitima].acidentada 'Primeira vitima'
        p "1 -> #{Celluloid::Actor[:vitima]}"
        Celluloid::Actor[:paramedico].acidentada 'Primeira vitima..'
        Celluloid::Actor[:curioso].tirar_foto

        sleep 1

        Celluloid::Actor[:vitima] = VitimaAcidentada.new
        p "2 -> #{Celluloid::Actor[:vitima]}"
        Celluloid::Actor[:vitima].acidentada 'Segunda vitima'
        Celluloid::Actor[:paramedico].acidentada 'Segunda vitima..'
        Celluloid::Actor[:curioso].tirar_foto

        sleep 1

        Celluloid::Actor[:vitima] = Vitima.new
        p "2 -> #{Celluloid::Actor[:vitima]}"
        Celluloid::Actor[:vitima].acidentada 'Terceira vitima'
        Celluloid::Actor[:paramedico].acidentada 'Terceiras vitima..'
        Celluloid::Actor[:curioso].tirar_foto
    end
end

Iniciar.new
