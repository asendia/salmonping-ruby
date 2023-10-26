# Salmonping Ruby
Ruby version of github.com/asendia/salmonping

This repo is built to test Gofood API integration example which is written in Ruby: https://developer.gobiz.com/docs/api/webhooks/receiving-notifications

Unfortunatelly the [GoBiz Emulator](https://api.partner-sandbox.gobiz.co.id/eimulator-client/gofood) doesn't work with the Ruby version as well.

## Run (Mac)

```sh
brew install rbenv
# Append this line at your ~/.zshrc
# eval "$(rbenv init - zsh)"

rbenv install 3.2.2
rbenv local 3.2.2

# Open new terminal tab
gem install bundle

# Install dependencies
bundle install

cp env-template .env
# And edit the .env based on value from https://developer.gobiz.com/

# Run 
ruby main.rb

# Test using curl or postman
# Get the X-Go-Signature & data-raw by deploying your server & logging
# request from Gobiz emulator
curl  -X POST \
  'http://localhost:8080/api/webhook/gofood' \
  --header 'Accept: */*' \
  --header 'User-Agent: Salmonping' \
  --header 'X-Go-Signature: SIGNATURE_RECEIVED_FROM_GOFOOD_WEBHOOK' \
  --header 'Content-Type: application/json' \
  --data-raw '{}'
```

## Deployment
This example is deployed to GCP, see cloudbuild.yaml
