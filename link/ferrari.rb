require 'celluloid'

class Ferrari
    include Celluloid

    def initialize
        puts "Ferrari é 100% segura :D"
    end

    def rodando_na_estrada
        puts "Ferrari, Tudo bem com esse carro\n"
    end
end