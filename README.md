# Descrição

Um projeto de API para criação de pesquisas, bem como questões, respostas e usuários para o aplicativo.

# Requerimentos

* Ruby on Rails 7.0.7.2
* Ruby 3.2.2
* Postgresql 15

# Para executar o projeto

```
git clone https://github.com/Alex-dev-if/survey_api_com_ror.git
```
* No seu editor de código, entre na pasta "survey_api_com_ror" que foi criada (no vscode basta entrar na pasta pelo terminal e digitar code .)
* Abra a pasta "config" e o arquivo "database.yml"
* Nos campos "username" e "password" mude para seus respectivos nome de usuário e senha do postgreSQL.
* Mude o nome databases para os de sua preferência. Por padrão está survey5.
* Agora, no cmd, na pasta "survey_api_com_ror" digite o comando 
  ```
  rails db:create
  ```
* Digite o comando 
  ```
  rails db:migrate
  ```
* O projeto já está pronto para executar, para fazer isso digite
  ```
  rails s
  ```
> [!NOTE]
> * Há uma pasta com todas as requisições graphql possíveis para testar a API. Ela se chama "requisicoes_graphql" e está dentro da pasta "app".
> * Testes RSpec disponíveis.

> [!IMPORTANT]
> Para testar as funcionalidades é necessário ter um usuário logado, passar o bearer token no header da requisição e estar com a role correta para aquela funcionalidade.
> Não é possível usar as funcionalidades de CreateUser e LoginUser com o usuário logado(de modo que inclua o bearer token).

# Diagramma de classe UML
![image](https://github.com/Alex-dev-if/survey_api_com_ror/assets/91799263/6bea470a-b006-4c91-ac4c-5d7a26080dba)


