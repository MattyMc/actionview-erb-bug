# ActionView ERB Bug

Invalid Rails views (`.erb` files) sometimes cause an infinite loop in development mode.

## Steps to Reproduce

**Important**: Use `kill -9 $(lsof -i tcp:3000 -t)` from the terminal to kill the Rails server process if needed. 

1. Clone this repo.
2. Make the script executable: ```chmod +x setup_rails_app.sh```
3. Run the script: ```./setup_rails_app.sh```
