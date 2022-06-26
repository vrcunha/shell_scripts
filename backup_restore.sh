echo "Iniciando restauração do backup."
cp -r /media/$USER/backup/Documents/* ~/Documents
cp -r /media/$USER/backup/Downloads/* ~/Downloads
cp -r /media/$USER/backup/Pictures/* ~/Pictures
cp -r /media/$USER/backup/_ssh/* ~/.ssh
cp -r /media/$USER/backup/_vscode/* ~/.vscode

# TODO: Modificar o script para que primeiro seja feito um unzip
# TODO: posteriormente a cópia dos arquivos
# TODO: deleção dos arquivos que foram deszipados

echo "Restauração finalizada com sucesso."