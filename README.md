## APPOINTMENTS BOOKING API - RUBY ON RAILS

The purpose of the project is to create an api that can be used to book appointments.
Our model domain is a hospital that provides users with a web based application through which they interface with this API.

The main areas of interest are:-
* Implementing correct associations for the different models (ER modeling and undestanding database schemas)
* Implementing authentication and authorization using JWT tokens and securing API endpoints
* Focusing on a Test Driven Development approach to development

### Tasks (API Description)
The API is RESTful and exposes the following endpoints. 
NOTE: All endpoints are returning JSON with associated response codes.

|Endpoint |Http Verb|Descritpion|
|---------------------|---------|-----------|
|/appointments        | GET     | list all appointments for a given user |
|/appointments/create | POST    | create an appointment |
|/appointments/:id    | GET     | get a specific appointment |
|/appointments/:id    | PATCH   | update a field of a specific appointment |
|/appointments/:id    | PUT     | update an appointment |
|/auth/login          | POST    | login a user and create a token for them |
|/signup              | POST    | creates a new user in the system |

### Software Versions
The application is built using `version 2.7.1 of the Ruby language` and `v6.0.3.3 of rails`.
For a complete list of dependencies, please check the GemFile in the project respository.

Although I have not used a pinned version of rubocop in the application, all cops were run using `v0.91.1 of Rubocop`, in case you get any warnings about new cops, please recall this.

### Configuration
Please make sure that you have a version of postgres installed on your machine, this application has been tested against `version 13 of postgres` and a version of `ruby preferably 2.7.*`. 

To run the API application on your machine, please follow these instructions after cloning it.
Run the following commands in the root directory of your cloned application
* `bundle install` - installs all dependencies specified in the `Gemfile`
* `bundle exec db:create` - create all development and test databases
* `bundle exec db:migrate` - runs all migrations against the target databases

If all commands listed above execute properly then 
* run `rails s` in order to serve the application at the default port 3000 - change this if you need to

### Testing
In order to run the tests make sure you have installed RSpec. 
A version was included in the Gemfile, if you installed all gems with the bundler, then it should be present at this moment.

* run `bundle exec rspec -f d` in the root directory in a terminal in order to see all test results

### Deployment Instructions
For deployment, please refer to the heroku documentation or the platform of your choice's documentation.

If you deploy to heroku, like we did, then make sure to have the following environment variable because it is used to sign JWT tokens.

```
SECRET_KEY_BASE
```

Refer to the code snippet below to see where it's used.

```ruby
class JsonWebToken
  # secret to encode and decode tokens
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    # set expiry to 24 hours from the creation time
    payload[:exp] = exp.to_i

    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    # get payload :- first index in decoded array
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body

    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end
```

### Issues and Contributions
For any questions, bugs or issues, please reach me though the contact below or open up an issue.
For contributions, please open up a pull request (PR). All contributions are welcome.

### Contributors

* [Edward Iga Kigongo](https://github.com/igakigongo)

### Contact
* Email: igakigongo@gmail.com
* LinkedIn: https://www.linkedin.com/in/igakigongo/
* PluralSight: https://app.pluralsight.com/profile/edward-iga

