#!/bin/bash

# Ruta del archivo YAML persistente
CONFIG_FILE="/data/config.yaml"

# Si no existe el archivo config.yaml, copiar el archivo base
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Archivo config.yaml no encontrado en /data, copiando archivo predeterminado..."
    cp /botaffiumeiro/config.yaml "$CONFIG_FILE"
fi

# Actualizando valores en config.yaml desde las opciones del complemento
echo "Actualizando valores en $CONFIG_FILE..."

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

echo "Valores actualizados en $CONFIG_FILE:"
cat $CONFIG_FILE

# Iniciar la aplicación
echo "Iniciando la aplicación..."
python3 /botaffiumeiro/botaffiumeiro.py
