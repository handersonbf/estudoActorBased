require 'celluloid'

class Vitima
    include Celluloid

    def initialize
        p "Vítima no local do Acidente"
    end
    
    def acidentada(coisa)
        p "Vitima com sorte.. #{coisa}"
    end
end