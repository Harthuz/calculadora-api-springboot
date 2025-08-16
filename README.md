# Calculadora API

Uma simples API REST para realizar operações matemáticas básicas, construída com Java e Spring Boot.

## Descrição

Este projeto é uma aplicação web que expõe endpoints para somar, subtrair, multiplicar e dividir números. A lógica de negócio é separada em uma camada de serviço, e a aplicação inclui testes unitários e suporte para Docker.

## Tecnologias Utilizadas

- Java 21
- Spring Boot 3
- Maven
- Docker

## Endpoints da API

A base da URL para todos os endpoints é `/api/calculadora`.

| Operação      | Método | Endpoint       | Parâmetros                               | Exemplo de Requisição                                  | Resposta de Sucesso (200 OK) |
|---------------|--------|----------------|------------------------------------------|--------------------------------------------------------|------------------------------|
| **Soma**      | `GET`  | `/somar`       | `a` (double), `b` (double)               | `GET /api/calculadora/somar?a=10&b=5`                  | `15.0`                       |
| **Subtração** | `GET`  | `/subtrair`    | `a` (double), `b` (double)               | `GET /api/calculadora/subtrair?a=10&b=5`               | `5.0`                        |
| **Multiplicação**| `GET`  | `/multiplicar` | `a` (double), `b` (double)               | `GET /api/calculadora/multiplicar?a=10&b=5`            | `50.0`                       |
| **Divisão**   | `GET`  | `/dividir`     | `a` (double), `b` (double)               | `GET /api/calculadora/dividir?a=10&b=5`                | `2.0`                        |

### Tratamento de Erros

- **Divisão por zero**: Ao tentar dividir por zero, a API retornará um status `400 Bad Request` com a mensagem "Divisão por zero não é permitida".

## Como Executar

### Pré-requisitos

- JDK 21 ou superior
- Maven 3.8 ou superior
- Docker (opcional, para execução em contêiner)

### Executando localmente

1. Clone o repositório:
   ```sh
   git clone <url-do-repositorio>
   cd calculadora
   ```

2. Execute a aplicação usando o Maven Wrapper:
   ```sh
   ./mvnw spring-boot:run
   ```

A aplicação estará disponível em `http://localhost:8080`.

### Executando com Docker

1. Construa a imagem Docker:
   ```sh
   docker build -t calculadora-api .
   ```

2. Execute o contêiner:
   ```sh
   docker run -p 8080:8080 calculadora-api
   ```

## Como Testar

Para rodar os testes unitários, execute o seguinte comando na raiz do projeto:

```sh
./mvnw test
```
