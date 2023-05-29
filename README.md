# README

The purpose of this project is to fetch some NPI (National Provider Identifier) info from the NPI Api (more details at the [NPI Api Help](https://npiregistry.cms.hhs.gov/registry/help-api)), for a given NPI-1 or NPI-2 number, save it to the database and show the results on a table.

The project runs on top of [Ruby on Rails](https://rubyonrails.org/), using SQLite (the standard database for a rails app), with some styling using [Bootstrap](https://getbootstrap.com/), served via [Vite](https://vitejs.dev/)

## Setting up the project
All you need to do is clone the repository and follow the standard steps for a rails project and vite:

1. Install project dependencies:
  ```bash
  $ bundle install
  ```
2. Create and migrate the database in order to have the DB structure ready for work

```
$ bundle exec rails db:create
$ bundle exec rails db:migrate
```

3. Start the rails server
```
$ bundle exec rails server
```

4. Start the Vite server to get the assets working properly

```
$ bundle exec rails server
```

## Accessing the project

Now you might have everything up and running, you can simply browse to [http://localhost:3000](http://localhost:3000), and you might see a form where you can input your search criteria.

If you searched for a valid and existing NPI record, you will be redirected to a page containing a table with the data from the requested NPI record.

