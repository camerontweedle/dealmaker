# Dealmaker Clone

This app has been initilized as per https://docs.docker.com/compose/rails/

## Build Image
`docker-compose build`

## Initialize DB
`docker-compose run web rails db:create`

## Run Migrations
`docker-compose run web rails db:migrate`

## Seed DB
`docker-compose run web rails db:seed`

## Run Tests
`docker-compose run web rails test`

NOTE: coverage report available at `/coverage/index.html` and is best viewed in a web browser as a `file://` etc

## Rubocop
`docker-compose run web rubocop`

## Run Container
`docker-compose up`

(server should now be accessible at http://localhost:3000)

NOTE: if any permission errors are encountered with docker, try changing the ownership of the generated files, ie. `sudo chown -R $USER:$USER .` and/or rerunning the command with `sudo`