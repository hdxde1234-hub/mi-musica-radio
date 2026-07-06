# 1. Tu carpeta de música estética
musica = playlist.safe(mode="normal", reload_mode="watch", "/home/runner/work/mi-musica-radio/mi-musica-radio/music")

# 2. Configuración de variables
host = environment.get("STREAM_HOST")
port = int_of_string(environment.get("STREAM_PORT"))
password = environment.get("STREAM_PASSWORD")
punto_montaje = environment.get("STREAM_MOUNT")

# 3. Transmisión corregida (Sin inventar parámetros raros)
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje,
  fallible=true,
  musica
)
