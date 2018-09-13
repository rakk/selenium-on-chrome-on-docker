# selenium-on-chrome-on-docker

## Current status

Running chrome in headless mode.

## Init

Download google-chrome-stable-65.0.3325.181-1pclos2018.x86_64.rpm

## Build

then:
```
docker build -t mychrome . 
```

## Run
```
docker run -it -p 9222:9222 mychrome
```

and open in browser:
```
http://localhost:9222
```
