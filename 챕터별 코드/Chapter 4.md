## 실습준비 (page 126)
```
$ git clone https://github.com/Karoid/mongodb_tutorials.git
$ cd mongodb_tutorials
$ cd operating_expenses
$ mongoimport -d operating_expenses -c population --file population.json
$ mongoimport -d operating_expenses -c city_or_province --file city_or_
province.json
$ mongoimport -d operating_expenses -c local --file local.json
```

## Rating 컬렉션 생성 (page 136)

```
db.rating.insertMany([
  {_id: 1, rating: 1, user_id: 2},
  {_id: 2, rating: 2, user_id: 3},
  {_id: 3, rating: 3, user_id: 4},
  {_id: 4, rating: 3, user_id: 1},
  {_id: 5, rating: 4, user_id: 5},
  {_id: 6, rating: 4, user_id: 8},
  {_id: 7, rating: 5, user_id: 9},
  {_id: 8, rating: 5, user_id: 10},
  {_id: 9, rating: 5, user_id: 11},
  {_id: 10, rating: 5, user_id: 12}
])
```