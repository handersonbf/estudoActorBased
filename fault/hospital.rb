require 'celluloid'
require_relative 'vitima'
require_relative 'paramedico'

class Hospital < Celluloid::SupervisionGroup
    supervise Vitima, as: :vitima
    supervise Paramedico, as: :paramedico
end