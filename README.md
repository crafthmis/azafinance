# README

Chitter is the next big thing in short-form messaging for tanukis.


### To run this project:
 - Install ruby and bundler (with `gem install bundler`)
 - Install dependencies: `bundle`
 - Create a postgres installation. You can either
   - Use docker: `docker run -d --name chitter-db -p 5432:5432 -e POSTGRES_PASSWORD=password postgres`
   - Set up a postgres server locally on port 5432 (or modify the port in `config/database.yml`)
     - Give the `postgres` user a password of `password`, or change the password in `config/database.yml`
 - Prepare the database:
   - `bin/rails db:create db:schema:load`
 - Run the application `bin/rails s`

### To interact with the database directly
   - If you used docker: `docker exec -it chitter-db psql -d chitter_development -U postgres`
   - Otherwise connect to your database with `psql` or another client.