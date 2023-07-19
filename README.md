
#Projeto de automatização e acesso aos Laboratórios da UFCA

## Navegue aqui :3

* [To do](#to-do)
* [Informações gerais](#informações-gerais)
* [Capturas de tela](#screenshots)
* [Tecnologias](#tecnologia)
* [Setup](#setup)
* [License](#license)

## Informações gerais

Este projeto está sendo desenvolvido para uso dos laborátorios da UFCA. O programa principal Veyon, é de código livre  

## To do

- [ ] Documentação
- [x] Implementação

#### Veyon:
* [Para mais informações]([https://github.com/derleymad/projeto-app-native/blob/main/curativar/package.json](https://github.com/veyon/veyon))

## Setup 
### No cmd como administrador:

Para instalar o computador a ser controlado com HD:
```cmd
powershell -Command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/scripts/initial-config-basic-hd.bat" -OutFile initial-config-basic-hd.bat; & ".\initial-config-basic-hd.bat"
```
Para instalar o computador a ser controlado com SSD:
```cmd
powershell -Command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/scripts/initial-config-basic-ssd.bat" -OutFile initial-config-basic-ssd.bat; & ".\initial-config-basic-ssd.bat"
```
Para instalar no computador master

```cmd
powershell -Command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/scripts/install-or-update-master.bat" -OutFile install-or-update-master.bat; & ".\install-or-update-master.bat"
```

### Setup - Atualizar filas e IP's

```cmd
powershell -Command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/derleymad/win-power-ufca/main/scripts/update-ips.bat" -OutFile update-ips.bat; & ".\update-ips.bat"
```

Para importar todos os IP's Nomes e Macs do laboratório para o Veyon Master, baixar dos as panilhas do google sheet e adiciona-las na pasta principal do veyon C:\Program Files\Veyon, em seguida rodar o arquivo importscvs.bat como administrador

## Licença

```html
MIT Licence 

Copyright (c) 2023 DTI - UFCA

Permission is hereby granted, free of charge, to any person obtaining a copy of this software
and associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial 
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
AND NONINFRINGEMENT.IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

