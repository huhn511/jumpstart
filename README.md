# Rails Jumpstart

It's like Laravel Spark, for Rails. All your Rails apps should start off with a bunch of great defaults.

**Note:** Requires Rails 5.2

## Getting Started

Jumpstart is a Rails template, so you pass it in as an option when creating a new app.

#### Requirements

You'll need the following installed to run the template successfully:

* Ruby 2.5+
* bundler - `gem install bundler`
* rails - `gem install rails`
* Yarn - `brew install yarn` or [Install Yarn](https://yarnpkg.com/en/docs/install)

#### Creating a new app

```bash
rails new myapp -T -d postgresql -m https://raw.githubusercontent.com/huhn511/jumpstart/master/template.rb
```

Or if you have downloaded this repo, you can reference template.rb locally:

```bash
rails new myapp -T -d postgresql -m template.rb
```

#### Setup app

### Setup user

1. go to db/migrate/xxx_devise_create_users.rb

remove the comment (#) from lines after Trackable, Confirmable and Lockable.

2. go to config/initializers/friendly_id.rb

remove the comment (#)
```bash
# config.treat_reserved_as_conflict = true
```

### Favicon

Replace the favicon with yours in app/asstest/images and run this command:

```bash
rails generate favicon
```


#### Run tests

```bash
rspec
```

#### Authenticate with social networks

We use the encrypted Rails Credentials for app_id and app_secrets when it comes to omniauth authentication. Edit them as so:

```
EDITOR=vim rails credentials:edit
```

Make sure your file follow this structure:

```
secret_key_base: [your-key]
development:
  github:
    app_id: something
    app_secret: something
    options:
      scope: 'user:email'
      whatever: true
production:
  github:
    app_id: something
    app_secret: something
    options:
      scope: 'user:email'
      whatever: true
```

With the environment, the service and the app_id/app_secret. If this is done correctly, you should see login links
for the services you have added to the encrypted credentials using `EDITOR=vim rails credentials:edit`

#### Cleaning up

```bash
rails db:drop
spring stop
cd ..
rm -rf myapp
```
