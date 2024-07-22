# ActionView ERB Bug

Invalid Rails views (`.erb` files) sometimes cause an infinite loop in development mode.

## Steps to Reproduce

**Important**: Use `kill -9 $(lsof -i tcp:3000 -t)` from the terminal to kill the Rails server process if needed. 

Clone the repo:
```bash
git clone https://github.com/MattyMc/actionview-erb-bug.git
cd actionview-erb-bug
```

Make the setup script executable, run the script:
```bash
chmod +x setup_rails_app.sh
./setup_rails_app.sh
```
