echo "Iniciando backup."
zip -r /media/$USER/backup/teste.zip /home/$USER/*

# TODO: Versionamento do backup para copiar apenas o que foi modificado.
# TODO: Selecionar apenas algumas pastas e não toda a home

echo "Backup finalizado com sucesso."