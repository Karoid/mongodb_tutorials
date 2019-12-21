[목록으로 돌아가기](../readme.md)

## 복제 세트 구성하기 (page 326)
디렉토리 생성  

[Windows]
```
mkdir C:\db\data\rs0-0
mkdir C:\db\data\rs0-1
mkdir C:\db\data\rs0-2
```

[Linux & Mac]
```
mkdir -p /db/data/rs0-0 /db/data/rs0-1 /db/data/rs0-2
```
mongod 인스턴스 실행
```
[명령어 창1]
$ mongod --replSet rs0 --port 27018 --bind_ip localhost --dbpath /db/
data/rs0-0
[명령어 창2]
$ mongod --replSet rs0 --port 27019 --bind_ip localhost --dbpath /db/
data/rs0-1
[명령어 창3]
$ mongod --replSet rs0 --port 27020 --bind_ip localhost --dbpath /db/
data/rs0-2
```
rs.initiate
```
> rs.initiate( {
  _id : "rs0",
  members: [
  { _id: 0, host: "localhost:27018" },
  { _id: 1, host: "localhost:27019" },
  { _id: 2, host: "localhost:27020" }
  ]
})
```

[목록으로 돌아가기](../readme.md)