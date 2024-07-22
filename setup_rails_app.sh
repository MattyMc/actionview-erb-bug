#!/bin/bash

# Script to set up a new Rails application with specific requirements
# Requirements:
# - Ruby 3.2.4 installed
# - Rails 7.1.3.4 installed
# - PostgreSQL installed and running

REQUIRED_RUBY_VERSION="3.2.4"
REQUIRED_RAILS_VERSION="7.1.3.4"

# Function to check Ruby version
check_ruby_version() {
  ruby_version=$(ruby -v | awk '{print $2}')
  if [ "$ruby_version" != "$REQUIRED_RUBY_VERSION" ]; then
    echo "Ruby version $REQUIRED_RUBY_VERSION is required."
    echo "You are using Ruby $ruby_version."
    echo "Please install and use Ruby $REQUIRED_RUBY_VERSION."
    echo "If you are using rvm, you can install and use the correct version with the following commands:"
    echo "rvm install $REQUIRED_RUBY_VERSION"
    echo "rvm use $REQUIRED_RUBY_VERSION --default"
    exit 1
  fi
}

# Function to check Rails version
check_rails_version() {
  rails_version=$(rails -v | awk '{print $2}')
  if [ "$rails_version" != "$REQUIRED_RAILS_VERSION" ]; then
    echo "Rails version $REQUIRED_RAILS_VERSION is required."
    echo "You are using Rails $rails_version."
    echo "Please install Rails $REQUIRED_RAILS_VERSION."
    echo "You can install the correct version with the following command:"
    echo "gem install rails -v $REQUIRED_RAILS_VERSION"
    exit 1
  fi
}

# Ensure the correct Ruby version is being used
echo "Checking Ruby version..."
check_ruby_version

# Ensure the correct Rails version is being used
echo "Checking Rails version..."
check_rails_version

# Create a new Rails app called 'actionview-erb-bug' with a PostgreSQL database
echo "Creating a new Rails app called 'actionview-erb-bug' with a PostgreSQL database..."
rails _7.1.3.4_ new actionview-erb-bug -d postgresql

# Change directory into the new app
echo "Changing directory into the new app..."
cd actionview-erb-bug

# Scaffold a Post resource with a name:string
echo "Scaffolding a Post resource with a name:string..."
rails generate scaffold Post name:string

# Replace the contents of "posts#new" with the provided code
echo "Replacing the contents of 'posts#new' with the provided code..."
echo '<% if true %>
  <span>Hello World</span><%# comment %>
  <%= asd.asd %>
<% end %>' > app/views/posts/new.html.erb

# Create and migrate the database
echo "Creating and migrating the database..."
rails db:create db:migrate

# Replace routes.rb file with the provided routes and add a root route
echo "Replacing routes.rb file with the provided routes and adding a root route..."
echo "Rails.application.routes.draw do
  resources :posts
  root 'posts#new'
end" > config/routes.rb


# Print completion message
echo "Rails app 'actionview-erb-bug' is set up, routes have been updated, and the server is running."
echo "IMPORTANT: Use the command below to kill the server process if it triggers an infinite loop:"
echo "kill -9 $(lsof -i tcp:3000 -t)"

# Start the Rails server
echo "Starting the Rails server..."
rails server

