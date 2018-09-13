#!/bin/bash

run_selenium_server() {
  echo "Running seleniun server in background..."
  java -Dwebdriver.chrome.driver=/opt/chromedriver -jar /opt/selenium-server-standalone-3.14.0.jar -role hub -port 4444 &

  delay="7s"
  echo "Sleep for ${delay}"
  sleep ${delay}
  echo "Let's run test"
}

run_selenium_server_node() {
  echo "Running seleniun NODE server in background..."
  java -Dwebdriver.chrome.driver=/opt/chromedriver -jar /opt/selenium-server-standalone-3.14.0.jar -role node -port 5555 -browser "browserName=chrome,chrome_binary=/usr/bin/google-chrome-stable --disable-gpu --headless --no-sandbox" &

  delay="7s"
  echo "Sleep for ${delay}"
  sleep ${delay}
  echo "Let's run test"

}

run_selenium_server

run_selenium_server_node

# testing google chrome:
# exec /usr/bin/google-chrome-stable \
#  --disable-gpu --headless --no-sandbox \
#  --remote-debugging-address=0.0.0.0 \
#  --remote-debugging-port=9222 --user-data-dir=/data \
#  --disable-dev-shm-usage

exec node /opt/google_test.js