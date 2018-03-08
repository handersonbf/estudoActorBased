require 'celluloid'

class Reporter
    include Celluloid
    trap_exit :ator_morreu
  
    def initialize
      puts "A reporter chegou para trabalhar"
    end
  
    def ator_morreu(actor, reason)
      p "Meu Deus! #{actor.inspect} acabou de falecer por causa do  #{reason.class}\n"
    end
end