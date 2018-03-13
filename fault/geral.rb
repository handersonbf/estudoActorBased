require 'celluloid'

class PorscheSpider
    include Celluloid
    class CarInMyLaneError < StandardError; end
  
    def drive_on_route_466
      raise CarInMyLaneError, " head on collision :("
    end
end

class Fusquinha
    include Celluloid
  
    def drive_on_route_466
      p "No FUSQUINHA está seguro :D"
    end
end
  
class JamesDean
    include Celluloid
  
    def initialize
      @little_bastard = Celluloid::Actor[:carro]
    end
  
    def drive_little_bastard
      @little_bastard.drive_on_route_466
    end
end

class ElizabethTaylor
    include Celluloid
    trap_exit :actor_died

    def actor_died(actor, reason)
        p "Oh no! #{actor.inspect} has died because of a #{reason.class}"
    end
end

class Iniciar
    include Celluloid
    def initialize
        Celluloid::Actor[:james] = JamesDean.new
        eli = ElizabethTaylor.new
        
        p "-----------------"
        p Celluloid::Actor[:carro] = Fusquinha.new_link
        p "2 ////----->  #{Celluloid::Actor[:carro]}"
        
        eli.link Celluloid::Actor[:james]
        Celluloid::Actor[:james].async.drive_little_bastard



        p Celluloid::Actor[:carro] = PorscheSpider.new_link
        p "1 ////----->  #{Celluloid::Actor[:carro]}"
        james = JamesDean.new
        
        eli.link Celluloid::Actor[:james]

        # james = JamesDean.new
        

        Celluloid::Actor[:james].async.drive_little_bastard

    end
end

Iniciar.new
