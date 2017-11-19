## JSON Server

[JSON Server](https://github.com/typicode/json-server) provides a full fake REST API with a simple JSON file.

## Usage

Create a copy of sample_db.json named db.json.

```
$ cp sample_db.json db.json
```

If you want to add custom routes, create a copy of sample_routes.json named routes.json.


```
$ cp sample_routes.json routes.json
```

Start a container.
```
$ docker-compose up -d
```

Now you can access http://localhost:3000/.

### Update db.json

If you update db.json, please restart docker container as follows.

```
$ docker-compose restart
```
