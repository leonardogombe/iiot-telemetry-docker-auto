# Nome do arquivo do compose (ajuste se o seu tiver outro nome)
$composeFile = "docker-compose.yml"
$composeFile1 = "docker-compose1.yml"

Write-Host "Aguardando a conexao com a internet para subir o Docker..." -ForegroundColor Yellow

# Loop infinito que testa a internet a cada 10 segundos
while ($true) {
    # Testa se consegue alcançar o DNS do Google (8.8.8.8)
    $conexao = Test-Connection -ComputerName 8.8.8.8 -Count 1 -Quiet

    if ($conexao) {
        Write-Host "Internet detectada! Iniciando o Docker Compose..." -ForegroundColor Green
        
        # Executa o docker compose
        docker compose -f $composeFile -f $composeFile1 up -d

        if ($LASTEXITCODE -eq 0){
            write-Host "Tudo Pronto!! O Docker foi iniciado com sucesso." -ForegroundColor Cyan
            break # Encerra o script apenas após o sucesso
        }else{
            Write-Host "Ocorreu um erro ao subir os containers. Tentanto novamente em 2 minutos.." -ForegroundColor Red
        }
    }
        else {
        Write-Host "Sem internet. Tentando novamente em 2 minutos..." -ForegroundColor DarkGray      
         Start-Sleep -Seconds 120
        }
    }
   

