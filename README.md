Startar a Aplicação

- configurar o dev.exs com o seu banco de dados postgres.

Startar a aplicação com o docker-compose

-você precisa configurar o dev.exs>hostname para **db**

Startar a aplicação em ambiente docker de produção
Obrigatório passar como variáveis de ambiente: `SECRET_KEY_BASE`, `DATABASE_URL`

- docker build -t nomerepo/nomeapp:versão .
- docker run --env-file .envrc -p 8080:4000 nomerepo/nomeapp:versao
