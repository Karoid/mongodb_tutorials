## 맥 개발환경 구축 (page 16)

```bash
$ brew install node
$ brew install mongodb
```

## 리눅스 개발환경 구축 (page 17)

[[Ubuntu 18.04 기준]]
```bash
$ echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/
mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodborg-
4.0.list
```

[[Ubuntu 16.04 기준]]
```bash
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu
xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/
mongodb-org-4.0.list
```
[[Ubuntu 14.04 기준]]
```bash
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/
mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodborg-
4.0.list
```

```bash
$ sudo apt-get update
$ sudo apt-get install -y mongodb-org
```

## MongoDB 서비스 등록 (page 20)

```
$ sudo apt-get install curl
$ curl -o /etc/init.d/mongod
https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d
$ chmod 755 /etc/init.d/mongod
$ systemctl enable mongod
```

