# Tu carpeta con tus MP3 listos
musica = playlist.safe("/music")

# Agarramos tus datos desde las variables de entorno de Render
host = environment.get_default("STREAM_HOST", "95.154.196.37")
port = int_of_string(environment.get_default("STREAM_PORT", "37413"))
password = environment.get_default("STREAM_PASSWORD", "iranamorir")
punto_montaje = environment.get_default("STREAM_MOUNT", "/stream")

# Conexión directa a Icecast
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje, 
  musica
)
