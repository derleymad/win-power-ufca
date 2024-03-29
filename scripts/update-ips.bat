mkdir "C:\lab-config"
cd "C:\lab-config"

wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20BIBLIOTECA.csv" -O "FILAS - BIBLIOTECA.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_A02.csv" -O "FILAS - LAB_A02.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_C02.csv" -O "FILAS - LAB_C02.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_E02.csv" -O "FILAS - LAB_E02.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_G11.csv" - O "FILAS - LAB_G11.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_G23.csv" -O "FILAS - LAB_G23.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_K02.csv" -O "FILAS - LAB_K02.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_K04.csv" -O "FILAS - LAB_K04.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20LAB_K07.csv" -O "FILAS - LAB_K07.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20CCAB_M105.csv" -O "FILAS - CCAB_M105.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20CCAB_M107.csv" -O "FILAS - CCAB_M107.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20BJS.csv" - O "FILAS - BJS.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20BJS2.csv" - O "FILAS - BJS2.csv"
wget -q "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/planilhas/FILAS%%20-%%20FAMED.csv" - O "FILAS - FAMED.csv"


curl -O "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/server-config/server-config.json"
curl -O "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/chave/lab_public_key.pem"
curl -O "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/chave/lab_private_key.pem"

"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - BIBLIOTECA.csv" location "BIBLIOTECA" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_A02.csv" location "LAB_A02" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_C02.csv" location "LAB_C02" format "%%name%%,%%host%%,%%mac%%"  
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_E02.csv" location "LAB_E02" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_G11.csv" location "LAB_G11" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_G23.csv" location "LAB_G23" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_K02.csv" location "LAB_K02" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_K04.csv" location "LAB_K04" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - LAB_K07.csv" location "LAB_K07" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - CCAB_M105.csv" location "CCAB_M105" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - CCAB_M107.csv" location "CCAB_M107" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - BJS.csv" location "LAB_BJS" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - BJS2.csv" location "LAB_BJS2" format "%%name%%,%%host%%,%%mac%%"
"C:\Program Files\Veyon\veyon-cli.exe" networkobjects import "FILAS - FAMED.csv" location "LAB_FAMED" format "%%name%%,%%host%%,%%mac%%"
PAUSE
