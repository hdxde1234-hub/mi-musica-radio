# 1. Tu carpeta estética de música
musica = playlist.safe(mode="normal", reload_mode="watch", "/home/runner/work/mi-musica-radio/mi-musica-radio/music")

# 2. Arreglo definitivo sin getenv (Ya no necesitamos el MOUNT)
host = environment.get("STREAM_HOST")
port = int_of_string(environment.get("STREAM_PORT"))
password = environment.get("STREAM_PASSWORD")

# 3. Mandar la señal a la nueva radio Shoutcast v1
output.shoutcast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  musica
)
