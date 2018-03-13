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
        
        Celluloid::Actor[:vitima] = Vitima.new
        vitima = Celluloid::Actor[:vitima] 
        paramedico = Celluloid::Actor[:paramedico] = Paramedico.new
        paramedico.link vitima

        Celluloid::Actor[:curioso] = Curioso.new

        p 'Hospital fica esperando dar merda...'
        Hospital.run!
        
        
        sleep 1

        vitima.acidentada 'Primeira vitima'
        # p "1 -> #{Celluloid::Actor[:vitima]}"
        Celluloid::Actor[:paramedico].acidentada 'Paramedico vai atender PRIMEIRA vitima..'
        Celluloid::Actor[:curioso].tirar_foto

        sleep 1

        Celluloid::Actor[:vitima] = VitimaAcidentada.new
        vitima =  Celluloid::Actor[:vitima] 
        paramedico.link Celluloid::Actor[:vitima]
        
        # p "2 -> #{Celluloid::Actor[:vitima]}"
        Celluloid::Actor[:vitima].acidentada 'Segunda vitima'
        Celluloid::Actor[:paramedico].acidentada 'Paramedico vai atender SEGUNDA vitima..'
        Celluloid::Actor[:curioso].tirar_foto
        
        sleep 1
        
        Celluloid::Actor[:vitima] = Vitima.new
        vitima =  Celluloid::Actor[:vitima] 
        paramedico.link vitima
        # p "2 -> #{Celluloid::Actor[:vitima]}"
        Celluloid::Actor[:vitima].acidentada 'Terceira vitima'
        Celluloid::Actor[:paramedico].acidentada 'Paramedico vai atender TERCEIRA vitima..'
        Celluloid::Actor[:curioso].tirar_foto
    end
end

Iniciar.new
