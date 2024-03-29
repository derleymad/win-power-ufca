mkdir "C:\lab-config"
cd "C:\lab-config"

wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20BIBLIOTECA.csv" -O "FILAS - BIBLIOTECA.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_A02.csv" -O "FILAS - LAB_A02.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_C02.csv" -O "FILAS - LAB_C02.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_E02.csv" -O "FILAS - LAB_E02.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_G23.csv" -O "FILAS - LAB_G23.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_K02.csv" -O "FILAS - LAB_K02.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_K04.csv" -O "FILAS - LAB_K04.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_K07.csv" -O "FILAS - LAB_K07.csv"


curl -O "https://github.com/derleymad/win-power-ufca/raw/main/imagens/image.jpeg"
curl -O "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/server-config/server-config.json"
curl -O "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/chave/lab_public_key.pem"
curl -O "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/chave/lab_private_key.pem"

choco install veyon --force --version 4.7.4 --params /Master '"/config:C:\lab-config\server-config.json"' -y

"C:\Program Files\Veyon\veyon-cli.exe" authkeys import lab/public "C:\lab-config\lab_public_key.pem"
"C:\Program Files\Veyon\veyon-cli.exe" authkeys import lab/public "C:\lab-config\lab_private_key.pem"

"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - BIBLIOTECA.csv" location "BIBLIOTECA" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_A02.csv" location "LAB_A02" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_C02.csv" location "LAB_C02" format "%%name%%,%%host%%,%%mac%%"  
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_E02.csv" location "LAB_E02" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_G23.csv" location "LAB_G23" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_K02.csv" location "LAB_K02" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_K04.csv" location "LAB_K04" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_K07.csv" location "LAB_K07" format "%%name%%,%%host%%,%%mac%%"
PAUSE
