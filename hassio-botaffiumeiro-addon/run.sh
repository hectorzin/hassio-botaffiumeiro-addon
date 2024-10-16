#!/bin/bash

# Ruta del archivo YAML
CONFIG_FILE="/botaffiumeiro/data/config.yaml"

# Actualizando valores en config.yaml
echo "Actualizando valores en $CONFIG_FILE..."

# Registrar si el archivo existe o no
if [ -f "$CONFIG_FILE" ]; then
    echo "El archivo $CONFIG_FILE existe."
else
    echo "El archivo $CONFIG_FILE no existe, creando uno nuevo desde el predeterminado."
    cp /botaffiumeiro/config.yaml "$CONFIG_FILE"
fi

# Mostrar el contenido del archivo YAML antes de las modificaciones
echo "Contenido del archivo antes de la actualización:"
cat $CONFIG_FILE

# Telegram settings
sed -i "s|bot_token:.*|bot_token: \"$BOT_TOKEN\"|" $CONFIG_FILE
sed -i "s|delete_messages:.*|delete_messages: $DELETE_MESSAGES|" $CONFIG_FILE

# Amazon settings
sed -i "s|affiliate_id:.*|affiliate_id: \"$AMAZON_AFFILIATE_ID\"|" $CONFIG_FILE

# Awin settings
sed -i "s|publisher_id:.*|publisher_id: \"$AWIN_PUBLISHER_ID\"|" $CONFIG_FILE

# Admitad settings
sed -i "s|publisher_id:.*|publisher_id: \"$ADMITAD_PUBLISHER_ID\"|" $CONFIG_FILE

# AliExpress settings
sed -i "s|app_key:.*|app_key: \"$ALIEXPRESS_APP_KEY\"|" $CONFIG_FILE
sed -i "s|app_secret:.*|app_secret: \"$ALIEXPRESS_APP_SECRET\"|" $CONFIG_FILE
sed -i "s|tracking_id:.*|tracking_id: \"$ALIEXPRESS_TRACKING_ID\"|" $CONFIG_FILE

# Mostrar el contenido después de las modificaciones
echo "Contenido del archivo después de la actualización:"
cat $CONFIG_FILE

# Iniciar la aplicación
echo "Iniciando la aplicación..."
python3 /botaffiumeiro/botaffiumeiro.py
