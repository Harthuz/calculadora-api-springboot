# Estágio 1: Build da aplicação com Maven
# Usamos uma imagem que já contém o Maven e o JDK 21
FROM maven:3.9-eclipse-temurin-21 AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o pom.xml e o wrapper do maven para aproveitar o cache de camadas do Docker
COPY pom.xml .
COPY .mvn/ .mvn/

# Baixa as dependências do projeto
RUN mvn dependency:go-offline

# Copia o restante do código-fonte
COPY src ./src

# Compila e empacota a aplicação, pulando os testes
RUN mvn package -DskipTests

# Estágio 2: Criação da imagem final
# Usamos uma imagem JRE (Java Runtime Environment) que é menor que a JDK
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Copia o arquivo .jar gerado no estágio de build para a imagem final
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta 8080, que é a porta padrão do Spring Boot
EXPOSE 8080

# Comando para executar a aplicação quando o contêiner iniciar
ENTRYPOINT ["java", "-jar", "app.jar"]