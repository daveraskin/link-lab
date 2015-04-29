#Link Board Lab

We are going to create a clone of [hacker news](https://news.ycombinator.com/). Hacker news is a reddit-style link board that allows users to post links which are upvoted by other users so the best links rise to the top.

For today we're going focus on `Users` and `Posts` only. The goal for tonight is to create an app that allows users to sign up, login, and add posts (no comments or voting yet).

##TDD

Use what we learned about rspec and factory_girl to create tests as you go.

##Models

####User
* email
* password_digest
* name

####Post
* title
* link
* user_id (created using user:references)


##Routes



###Auth

| Verb | Route | Action | Purpose |
|------|-------|------------|--------|---|
| GET | /signup | users#new | render user sign up form |
| POST | /signup | users#create | create user in database (signup) |
| GET | /login | sessions#new | render user log in form |
| POST | /login | sessions#create | create user session (login) |
| GET / DELETE | /logout | sessions#destroy | destroy user session (logout) |


###Post
Create full CRUD routes (see RESTful routing table if needed).

##Validations

* post.title
    * required
    * should be between 10 and 100 chars
* post.link
    * required
    * should be a valid url
* user.email
    * required
    * valid email
    * unique
* user.name
    * required
    * less than 20 chars



##Development Process

####Setup basic rails app / repo

* Create a new repo
* clone the newly created repo
* cd to cloned repo
* create new rails app `rails new ./ -T`
* test `rails s` go to localhost:3000 in browser

If this works this could be a good time to stop and do a commit and push it to github.

####Setup tests

* Add to gem file: rspec-rails, factory\_girl\_rails, responders
* install gems (run `bundle`)
* setup rspec (run `rails generate rspec:install`)


####Setup user / authentication

Create tests as you go to test the user controller / auth flow

* Create `User` model (with `has_secure_password` and validations)
* enable bcrypt gem in Gemfile
* migrate `rake db:migrate`
* test `rails c` User.create... etc...
* Create authentication routes / views / actions

####Setup posts

Create tests as you go to test the post controller

* Create `Post` model (with validations)
* migrate `rake db:migrate`
* test `rails c` Post.create... etc...
* Create crud routes / views / actions for `Post`

