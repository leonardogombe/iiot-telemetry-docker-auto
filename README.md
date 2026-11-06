# Resiliência e Automação de Stack IIoT/OT em Docker ⚙️📡

Ambiente local de engenharia de dados industrial (OT/IIoT) desenvolvido para garantir alta disponibilidade no descarregamento e orquestração de serviços de telemetria em cenários com alta instabilidade de rede.

---

## 🏗️ Arquitetura da Stack

A infraestrutura foi organizada de forma modular utilizando dois ficheiros Compose:

* 📦 **docker-compose.yml (Camada de Ingestão, Armazenamento IoT e Visualização):**

   * Eclipse Mosquitto: Broker MQTT para recepção de telemetria dos sensores.
     
  * Node-RED: Fluxos de ingestão e integração de dados.
  
  * InfluxDB & TimescaleDB: Bases de dados otimizadas para séries temporais (*time-series*).
    
  * Grafana: Dashboards para monitorização em tempo real.
    
* 🔄 **docker-compose1.yml (Camada de Streaming e Orquestração):**
  
  * Confluent Kafka: Barramento de eventos e streaming de dados em tempo real.
    
  * Apache Airflow: Engine para orquestração e agendamento de pipelines.
    
  * PostgreSQL: Base de dados relacional para metadados e suporte do Airflow.

---

## 🚀 Automação de Rede (auto_docker.ps1)

Em conexões instáveis, o descarregamento de imagens pesadas costuma falhar por *TLS handshake timeout*. 

O script em PowerShell contorna esse problema de forma autónoma:

1. Monitorização Ativa: Executa testes contínuos de conectividade DNS (8.8.8.8).
2. Reconexão Autónoma: Aguarda a re estabilização da internet sem parar a execução.
  
3. Orquestração Combinada: Dispara a subida dos dois ficheiros Compose simultaneamente.
5. Camadas em Cache: Aproveita a arquitetura de camadas do Docker para retomar downloads exatamente de onde pararam.




---

## 🛠️ Como Executar

No terminal PowerShell da pasta do projeto, execute:

`powershell
powershell -ExecutionPolicy Bypass -File .\auto_docker.ps1

Leonardo Gombe
Engenheiro de Dados Industrial (OT/IIoT) em Formação | 2º Ano de Engenharia Informática (ISPEKA)
LinkedIn http://www.linkedin.com/in/leonardo-gombe
