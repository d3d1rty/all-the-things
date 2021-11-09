# all-the-things

## Table of Contents

* About
  * Environments
* Getting started
  * Local setup
  * Mail
  * Jobs
* Contributing
  * Code style
  * Testing
  * Deployment

## About

This project is the group project for CSCI 4750.

### Environments

* [Test]()

## Getting Started

### Local Setup

To install, first ensure that you have `docker` and `docker-compose` installed and running, then clone the repo:

```
git clone git@github.com:d3d1rty/all-the-things.git
cd all-the-things
```

Create the local `.env` file and specify any sensitive credentials or other environment variables.

```
# No environment variables specified yet.
# Creating an empty .env file in the project root will be good for now.
```

Build the containers.

```
docker-compose build
```

Start the containers (detached).

```
docker-compose up -d
```

Get a shell in the web container.

```
docker-compose exec web /bin/bash
```

From here, you'll want to create the database and run any migrations. Please note that you'll want to execute most of your commands from
a shell within the container.

```
bundle exec rails db:create
bundle exec rails db:migrate
```

Start the server.

```
bundle exec rails s -b 0.0.0.0
```

If you need to perform other operations from within the containerwhile the server is running, you can simply get another shell in the web container.

```
docker-compose exec web /bin/bash
```

### Mail
This application uses Mailcatcher for local development and Mailcatcher in the staging and production environments. You
can access the Mailcatcher inbox by visiting [http://127.0.0.1:1080/](http://127.0.0.1:1080) in your browser. To
access the Mailtrap inboxes, you will need to click the Mailtrap integration from the app in the Heroku dashboard.

### Jobs

This project uses Sidekiq for job processing. You can view the job queues by visiting the `/sidekiq` endpoint.

## Contributing

### Code Style/Quality

We use Rubocop to enforce code style, Reek to find code smells, and Brakeman to find security violations.

To manually run `rubocop`, you can run the following commands:

```
# Run rubocop for the entire project
bundle exec rubocop

# Run rubocop for a specific file
bundle exec rubocop foo/bar.rb
```

To manually run `reek`, you can execute:

```
bundle exec reek
```

To manually run `brakeman`, you can execute:

```
bundle exec brakeman
```

### Testing

You can run the test suite on your local machine:

```
bundle exec rspec
```

### Deployment

Deployments to staging occur upon every merge to master. In order to run migrations following deployments, you will need the
[Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install) utility installed as well as access to the app instances.

To execute a migration on the staging/production apps, execute command:

```
heroku run rails db:migrate --app [APP NAME]
```
