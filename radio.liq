# 1. Tu carpeta de música estética
musica = playlist.safe(mode="normal", reload_mode="watch", "/home/runner/work/mi-musica-radio/mi-musica-radio/music")

# 2. Configuración de variables
host = environment.get("STREAM_HOST")
port = int_of_string(environment.get("STREAM_PORT"))
password = environment.get("STREAM_PASSWORD")
punto_montaje = environment.get("STREAM_MOUNT")

# 3. Transmisión con salida inteligente (on_shutdown)
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje,
  on_shutdown=fun () -> begin sleep(1.0) end, # Le da un segundo de colchón al buffer
  musica
)
