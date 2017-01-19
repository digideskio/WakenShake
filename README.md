# Wake 'N Shake
Wake 'N Shake is an annual charity event that occurs at Wake Forest University. This repository is a fundraising platform built in Ruby on Rails that allows Wake 'N Shake to raise over $300,000 for cancer research. In the past, we've had over 1,300 users actively use the site to raise funds.

## Setup
This Rails app requires Ruby 2.2.0 and Bundler. Clone this repository into a folder of your choice. Then navigate into the project folder and run:

```
$ bundle install
```

This will install all the gems that are required for this application.

Next, setup the Postgres database by executing:
```
$ rake db:create && rake db:setup
```

If you would like to see what the app looks like with demo data, simply execute the seed data scripts by running:

```
$ rake db:seed
```

This will create demo users, events, donations, and other data for reference.

To run the server, execute:

```
rails server
```
and navigate to [localhost:3000](localhost:3000) to see the application running locally on your device.

## Deployment
If you would like to deploy this platform, I would reccomend using [Heroku](https://www.heroku.com/) as a hosting service. The free tier should be sufficient enough to host all your needs.

Create an account on Heroku and create a new dyno for your deployment. Once you have created a remote repository for your project, you can execute the following to deploy:
```
$ git push heroku master
```

## Tests
There are minimal tests to ensure that the application is correctly serving pages. To run the tests, execute:
```
$ rake test
```

You can opt to sign up for [TravisCI](https://www.travisci.com) to run tests every time you push your changes to GitHub.

## License
This project is licensed under the MIT license.

