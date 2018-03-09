require 'celluloid'

class Curioso
    include Celluloid
    def initialize
        p 'Curioso chega no local'
    end

    def tirar_foto
        p 'Animal tirando foto :) '
    end
end