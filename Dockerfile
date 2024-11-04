FROM ruby:3.2

# Install postgres client, development headers, and build dependencies
RUN apt-get update -qq && \
    apt-get install -y postgresql-client build-essential git \
    postgresql-server-dev-all

# Install pgvector
RUN git clone --branch v0.5.1 https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make && \
    make install

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
