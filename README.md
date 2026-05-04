# DailyFlow

Gerenciador de tarefas diárias desenvolvido com Ruby on Rails 8.

---

## Funcionalidades

- **Autenticação** — cadastro, login e logout com senha criptografada (BCrypt)
- **Tarefas** — criação, edição e exclusão com título, descrição, prioridade e data de vencimento
- **Status** — marcar tarefas como concluídas diretamente na listagem (sem recarregar a página)
- **Prioridades** — três níveis: Baixa, Média e Alta, com badges visuais distintos
- **Data de vencimento** — campo opcional; tarefas atrasadas são destacadas em vermelho
- **Categorias** — agrupamento de tarefas por categoria com cor personalizada; 5 categorias padrão criadas automaticamente no cadastro
- **Filtros** — filtragem da listagem por categoria, prioridade e status (pendente/concluída)
- **Busca** — busca por título em tempo real na página atual
- **Paginação** — 10 tarefas por página, com filtros preservados na navegação

---

## Tecnologias

| Camada | Tecnologia |
|---|---|
| Framework | Ruby on Rails 8.1.2 |
| Linguagem | Ruby 3.2.2 |
| Banco (desenvolvimento) | SQLite3 |
| Banco (produção) | PostgreSQL |
| Frontend | Turbo, Stimulus, Importmap |
| Assets | Propshaft |
| Servidor | Puma |
| Paginação | Kaminari |

---

## Como subir a aplicação

### Com Docker (recomendado)

**Pré-requisito:** ter o [Docker](https://www.docker.com/) instalado.

```bash
# 1. Build da imagem (necessário apenas na primeira vez ou após mudar o Gemfile)
docker compose build

# 2. Subir a aplicação
docker compose up
```

Acesse em `http://localhost:3000`.

O banco de dados é criado e as migrations são aplicadas automaticamente na inicialização.

```bash
# Parar
docker compose down
```

---

### Sem Docker (local)

**Pré-requisitos:** Ruby 3.2.2 e Bundler instalados.

```bash
# 1. Instalar dependências
bundle install

# 2. Criar o banco e aplicar migrations
bin/rails db:create db:migrate

# 3. (Opcional) Popular com dados de exemplo
bin/rails db:seed
# Cria o usuário: kaue@exemplo.com / senha123

# 4. Subir o servidor
bin/rails server
```

Acesse em `http://localhost:3000`.

---

## Variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto com base no `.env.example`:

```bash
cp .env.example .env
```

| Variável | Descrição |
|---|---|
| `DATABASE_URL` | URL de conexão com o PostgreSQL (obrigatório em produção) |

---

## Banco de dados

| Ambiente | Arquivo |
|---|---|
| Desenvolvimento | `storage/development.sqlite3` |
| Teste | `storage/test.sqlite3` |
| Produção | PostgreSQL via `DATABASE_URL` |
