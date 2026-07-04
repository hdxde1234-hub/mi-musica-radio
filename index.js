
const express = require('express');
const { spawn } = require('child_process');
const app = express();
const PORT = process.env.PORT || 10000;

// Esta es la página que visitarán UptimeRobot y Cron-job
app.get('/', (req, res) => {
  res.send('<h1>📻 Radio Activa 24/7 en línea y escuchando pings!</h1>');
});

app.listen(PORT, () => {
  console.log(`Servidor web escuchando en el puerto ${PORT}`);
  
  // Aquí encendemos tu radio Liquidsoap en segundo plano
  console.log("Iniciando Liquidsoap...");
  const radio = spawn('liquidsoap', ['/music/radio.liq']);

  radio.stdout.on('data', (data) => console.log(`[Liquidsoap]: ${data}`));
  radio.stderr.on('data', (data) => console.error(`[Liquidsoap Error]: ${data}`));
});
