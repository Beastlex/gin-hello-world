## Simple project on Golang

To test localy

### Run MongoDB container with username and password

```
docker run -d --name mongodb \
  -e MONGO_INITDB_ROOT_USERNAME=<admin> \
  -e MONGO_INITDB_ROOT_PASSWORD=<password> \
  -p 27017:27017 mongo:4.4.3
```

### Run Redis for caching

```
docker run -d -v $PWD/conf:/usr/local/etc/redis --name redis -p 6379:6379 redis:6.0

```

### Build the app image with

```
docker build -t beastlex/gin-recipe:<version>
```

### Run image (override ENV variables with -e if need)

```
docker run beastlex/gin-recipe:<version>
```
