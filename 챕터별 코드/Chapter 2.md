## 다수 도큐먼트 생성 (page 51)

```mongodb
use testDB
db.user.insertMany( [
 { username: "John", password: 4321 },
 { username: "K", password: 4221 },
 { username: "Mark", password: 5321 },
 ] );
```

에러 발생시키기
```mongodb
use testDB
> db.myCollections.insertMany( [
 { _id: 13, item: "envelopes", qty: 60 },
 { _id: 13, item: "stamps", qty: 110 },
 { _id: 14, item: "packing tape", qty: 38 }
 ] );
```

## 도큐먼트 조회 (page 56)

```mongodb
use testDB
db.containerBox.insertMany([
  {name: "bear", weight: 60, category: "animal"},
  {name: "bear", weight: 10, category: "animal"},
  {name: "cat", weight: 2, category: "animal"},
  {name: "phone", weight: 1, category: "electronic"}
])
```
## 도큐먼트 수정 (page 68)

```mongodb
use testDB
db.user.replaceOne({ username: "karoid" },
  {
  username: "Karpoid",
  status: "Sleep",
  points: 100,
  password: 2222
  }
);
```

upsert 예시
```mongodb
db.myCollection.replaceOne({ item: "abc123" },
  {
  item: "abc123",
  status: "P",
  points: 100,
  },
  {upsert: true}
);
```

도큐먼트 수정 배열 연산자 (page 74)
```mongodb
db.character.insertMany([
  {name: 'x', inventory: ['pen', 'cloth', 'pen'] },
  {name: 'y', inventory: ['book', 'cloth'], position:{x:1, y:5}},
  {name: 'z', inventory: ['wood', 'pen'], position:{x:0, y:9}}
])
```