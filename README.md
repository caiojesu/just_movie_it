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

A arquitetura usada no app é baseada no DDD (Domain Driven Design) e no Clean Architecture, onde temos camadas com funções previamente definidas.

* Camada de apresentação (Presentation): contém os widgets e páginas do aplicativo. Essa camada deve ser independente de qualquer outra camada e deve se comunicar apenas com a camada de aplicação.

* Camada de aplicação (Application): contém os BloCs (ou Use cases), responsável por manter a lógica da aplicação.

* Camada de domínio (Domain): contém as entidades, os objetos de valor, as interfaces dos repositórios e as definições dos casos de uso.

* Camada de infraestrutura (Infrastructure): contém as implementações dos repositórios e outras classes relacionadas a infraestrutura da aplicação.
    * No projeto é usado o `Repository Pattern` sem o `data source` pois o escopo do projeto é pequeno e essa separação seria apenas uma complexidade a mais.



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

* A pasta `core` contém todo o código utilizado entre as outras features
    * `configs` contém as abstrações e implementações dos serviços de injeção de dependência, rotas e temas
    * `services` contém as abstrações e implementações dos serviços de `http` e `cache`
    * `exceptions` contém as exceções do projeto






