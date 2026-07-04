# 1. Tu carpeta estética de música
musica = playlist.safe(mode="normal", reload_mode="watch", "/home/runner/work/mi-musica-radio/mi-musica-radio/music")

# 2. Arreglo definitivo sin getenv
host = environment.get("STREAM_HOST")
port = int_of_string(environment.get("STREAM_PORT"))
password = environment.get("STREAM_PASSWORD")
punto_montaje = environment.get("STREAM_MOUNT")

# 3. Mandar la señal a la radio
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje, 
  musica
)
