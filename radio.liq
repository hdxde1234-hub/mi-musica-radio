# Tu carpeta con tus MP3 listos
musica = playlist.safe("/music")

# Tus datos fijos verificados de tu Listen2MyRadio Icecast
host = "95.154.196.37"
port = 37413
password = "iranamorir"
punto_montaje = "/stream" # Escribe aquí lo que te diga tu panel (ej: /live o /radio.mp3)

# Conexión directa a Icecast
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje, 
  musica
)
