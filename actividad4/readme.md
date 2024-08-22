# Configurar un Servicio `systemd`

## Archivo de Ejemplo

```ini
[Unit]
Description=Descripcion de tu servicio
After=network.target

[Service]
ExecStart=/path/to/service //parametros si se necesitan
Type=simple
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

## Pasos
1. Crear un archivo de servicio en `/etc/systemd/system/` o en `/lib/systemd/system/` con la extensión `.service`.
2. Escribir la configuración del servicio en el archivo.
3. Asegúrate de que los siguientes detalles sean correctos en el archivo:

    - Description: Proporciona una descripción significativa de tu servicio.
    - ExecStart: Debes especificar la ruta completa del ejecutable que deseas iniciar, seguido de cualquier argumento que requiera tu aplicación.
    - Type: Este campo generalmente se establece en simple si tu servicio es de tipo simple.
    - Restart: Puedes configurar cómo deseas que se reinicie el servicio en caso de fallo. En este caso, se reiniciará en caso de fallo (on-failure).
4. Recarga el daemon de systemd para que tome en cuenta los cambios en la configuración:
```bash
sudo systemctl daemon-reload
```

5. Inicia el servicio y habilítalo para que se inicie automáticamente al arrancar el sistema:
```bash
sudo systemctl start mi_servicio
sudo systemctl enable mi_servicio
```
6. Verifica el estado del servicio para asegurarte de que se está ejecutando sin problemas:
```bash
sudo systemctl status mi_servicio
```
7. Ver logs del servicio
```bash
journalctl -u mi_servicio.service
journalctl -u mi_servicio.service -f //para ver los logs en tiempo real
```