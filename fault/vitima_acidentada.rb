require 'celluloid'

class VitimaAcidentada
    include Celluloid

    def acidentada(coisa)
        p "E morreu.... #{coisa}"

        # raise StandardError, " esse vai da em morte....\n" 
        raise Celluloid::DeadActorError,  'Morreu'
    end
end