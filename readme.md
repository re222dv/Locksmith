# Locksmith

Locksmith is a rails mountable engine that provides api token management. Beeing a mountable engine
it's possible to include it in other rails apps to get API token management functionality.

## Instructions
1. Get the dependencies
    `bundle install`
1. Create the database
    `rake db:migrate`
1. Seed the database
    `rake app:locksmith:populate`
1. Go to the dummy application
    `cd spec/dummy`
1. Start the rails server
    `rails s`
1. Go to the app at
    `http://localhost:3000/locksmith`
1. Login as a normal user with `basic@user.com` or admin as `admin@user.com`
