# Just Movie it

Um aplicativo flutter que usa "[The Movie DB](https://www.themoviedb.org/)" API para buscar filmes e suas informações.

### Conteúdo

* [Executando o App](#executando-o-app)
* [Arquitetura](#arquitetura)
* [Estrutura das Pastas](#estrutura-das-pastas)

## Executando o App
Para executar o app uma chave de API do TMDB é necessária. Ao adquirir a chave basta iniciar o projeto usando os argumentos abaixo:

```
--dart-define=TMDB_API_KEY=<YOUR_API_KEY>
```

## Arquitetura

A arquitetura usada no app é baseada no DDD (Domain Driven Design) onde temos camadas com funções previamente definidas.

Na camada presentation, teremos os widgets e páginas do aplicativo, tem apenas a função de decorar o aplicativo, sendo assim, não possui nenhuma lógica de negócio ou validação.

Na camada application, teremos os BloCs (ou Use cases), responsável por receber as entradas do usuário vindas da camada presentation, validá-las e recuperar os dados necessários para aquela validação.

Na camada domain, teremos a camada mais desacoplada do aplicativo, não depende de nenhuma outra camada e tem responsabilidades relacionadas à regra de negócio do projeto, como, manter entidades, lógicas de validação e falhas.

Na camada infrastructure, teremos as conexões com o mundo externo à aplicação, responsável por receber esses dados externos e transformar em dados que podem ser legíveis por toda a aplicação.

## Estrutura das Pastas

```
lib
├── core
│   ├── configs
│   │   ├── router
│   │   └── injection
│   ├── exceptions
│   ├── services
│   │   ├── http
│   │   └── storage
│   └── widgets
├── features
│   └── movies
│      ├── presentation
│      ├── application
│      ├── domain
│      └── infrastructure
├── main.dart
└── app.dart
```


