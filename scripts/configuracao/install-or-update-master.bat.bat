
mkdir "C:\lab-config"
cd "C:\lab-config"

wget https://github.com/derleymad/win-power-ufca/raw/main/imagens/image.jpeg
wget https://raw.githubusercontent.com/derleymad/win-power-ufca/main/server-config/server-config.json
wget https://raw.githubusercontent.com/derleymad/win-power-ufca/main/chave/lab_public_key.pem
wget https://raw.githubusercontent.com/derleymad/win-power-ufca/main/chave/lab_private_key.pem

choco install veyon --force --version 4.7.4 --params /Master '"/config:C:\lab-config\server-config.json"' -y

"C:\Program Files\Veyon\veyon-cli.exe" authkeys import lab/public "C:\lab-config\lab_public_key.pem"
"C:\Program Files\Veyon\veyon-cli.exe" authkeys import lab/public "C:\lab-config\lab_private_key.pem"