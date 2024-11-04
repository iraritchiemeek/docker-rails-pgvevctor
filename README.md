# Rails API Application

This is a Rails API application configured with PostgreSQL, pgvector, and the [Neighbor](https://github.com/ankane/neighbor) gem for nearest neighbor search, running in Docker.

## Prerequisites

- Git
- Docker and Docker Compose
- A text editor

## Initial Setup

1. Clone the repository

2. Update application name references in the following files:

   - `bin/setup`: Update `APP_NAME`
   - `config/application.rb`: Update the module name
   - `config/database.yml`: Update database names
   - `config/cable.yml`: Update channel prefix
   - `docker-compose.yml`: Update database URL
   - `config/environments/production.rb`: Update job queue prefix

3. Build and start the Docker containers:
   ```bash
   docker-compose build
   docker-compose up
   ```

4. In a new terminal, set up the database with pgvector:
   ```bash
   docker-compose run web rails db:create
   docker-compose run web rails generate neighbor:vector
   docker-compose run web rails db:migrate
   ```

## Development

The application will be available at `http://localhost:3000`
