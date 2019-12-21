## 수동 실습 준비 (page 87)
```
$ git clone https://github.com/Karoid/mongodb_tutorials.git
$ cd mongodb_tutorials
$ cd car_accident
$ mongoimport -d car_accident -c area --file area.json
$ mongoimport -d car_accident -c by_month --file by_month.json
$ mongoimport -d car_accident -c by_road_type --file by_road_type.json
$ mongoimport -d car_accident -c by_type --file by_type.json
```

## 도큐먼트에서의 배열의 의미 (page 110)

```
db.inventory.insertMany([
 { item: "journal", qty: 25, tags: ["blank", "red"] },
 { item: "notebook", qty: 50, tags: ["red", "blank"] },
 { item: "paper", qty: 100, tags: },
 { item: "planner", qty: 75, tags: ["blank", "red"] },
 { item: "postcard", qty: 45, tags: ["blue"] }
]);
```

## 오브젝트 필드 프로젝션 (page 116)

```mongodb
{name: {first: "철수", last: "김"}}
{name: {first: "영희", last: "김"}}
{name: {first: "수영", last: "박"}}
{name: {first: "희영", last: "이"}}
```