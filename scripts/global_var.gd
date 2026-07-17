extends Node

# Constantes
const default_vel_mundo = 600.0
const default_vel_inimigo = 650.0

# Variáveis de velocidade do mundo
var vel_mundo = default_vel_mundo
var velMax_mundo = 1200.0
var accel_mundo = 6.0

# Variáveis de velocidade dos inimigos
var vel_inimigo = default_vel_inimigo
var velMax_inimigo = 1250.0
var accel_inimigo = 6.0

# Variáveis player
var morto = false
var recorde = 0
