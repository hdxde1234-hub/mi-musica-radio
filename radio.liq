# Tu carpeta con tus MP3 listos
musica = playlist.safe("/music")

# Ponemos tus datos fijos a la fuerza (sin buscar variables)
host = "95.154.196.37"
port = 37413
password = "iranamorir"

# Conexión directa
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount="/stream", 
  musica
)
