[목록으로 돌아가기](../readme.md)

## 샘플 샤드 클러스터 구성하기 (page 370)
config 서버 디렉토리 구성  

[Windows]
```
mkdir C:\db\data\config0-0
mkdir C:\db\data\config0-1
mkdir C:\db\data\config0-2
```
[Linux & Mac]
```
mkdir -p /db/data/config/rs0-0 /db/data/config/rs0-1 /db/data/config/
rs0-2
```

config 서버 mongod 인스턴스 생성
```
[명령어 창1]
$ mongod --configsvr --replSet config0 --port 27018 --bind_ip localhost
--dbpath /db/data/config0-0
[명령어 창2]
$ mongod --configsvr --replSet config0 --port 27019 --bind_ip localhost
--dbpath /db/data/config0-1
[명령어 창3]
$ mongod --configsvr --replSet config0 --port 27020 --bind_ip localhost
--dbpath /db/data/config0-2
```

config 서버 rs.initiate
```
> rs.initiate( {
  _id : "config0",
  configsvr: true,
  members: [
  { _id: 0, host: "localhost:27018" },
  { _id: 1, host: "localhost:27019" },
  { _id: 2, host: "localhost:27020" }
  ]
})
```

shard 서버 디렉토리 구성   

[Windows]
```
mkdir C:\db\data\shard0-0
mkdir C:\db\data\shard0-1
mkdir C:\db\data\shard0-2
```
[Linux & Mac]
```
mkdir -p /db/data/shard0-0 /db/data/shard0-1 /db/data/shard0-2
```

shard 서버 mongod 인스턴스 실행
```
[명령어 창1]
$ mongod --shardsvr --replSet shard0 --port 27021 --bind_ip localhost
--dbpath /db/data/shard0-0
[명령어 창2]
$ mongod --shardsvr --replSet shard0 --port 27022 --bind_ip localhost
--dbpath /db/data/shard0-1
[명령어 창3]
$ mongod --shardsvr --replSet shard0 --port 27023 --bind_ip localhost
--dbpath /db/data/shard0-2
```

shard 서버 rs.initiate
```
> rs.initiate( {
 _id : "shard0",
 members: [
 { _id: 0, host: "localhost:27021" },
 { _id: 1, host: "localhost:27022" },
 { _id: 2, host: "localhost:27023",arbiterOnly: true }
 ]
 })
```

## 컬렉션 샤딩을 위한 car_accident 데이터 불러오기 (page 374)
```
$ git clone https://github.com/Karoid/mongodb_tutorials.git
$ cd mongodb_tutorials
$ cd car_accident
$ mongoimport -d car_accident -c area --file area.json
--host=localhost:20000
$ mongoimport -d car_accident -c by_month --file by_month.json
--host=localhost:20000
$ mongoimport -d car_accident -c by_road_type --file by_road_type.json
--host=localhost:20000
$ mongoimport -d car_accident -c by_type --file by_type.json
--host=localhost:20000
```

[목록으로 돌아가기](../readme.md)