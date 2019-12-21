## Python-Django
Django_MongoDB/setting.py
```python
# Database
DATABASES = {
'default': {
'ENGINE': 'djongo',
'NAME': <데이터베이스 이름>, #필자는 django_dev로 설정
'USER': <데이터베이스 접근 유저명>,
'PASSWORD': <비밀번호>,
'HOST': <몽고디비 호스트 IP 주소>,
'PORT': <몽고디비 포트 번호>,
}
}
```

기본 models.py
```python
from djongo import models
class Board(models.Model):
  title = models.CharField(max_length=100)
class Article(models.Model):
  board = models.ForeignKey(Board, on_delete=models.CASCADE)
  title = models.CharField(max_length=100)
  content = models.TextField()
```
임베디드 도큐먼트 모델링 models.py
```python
from djongo import models

class Board(models.Model):
  title = models.CharField(max_length=100)
class Meta:
  managed = False
class Article(models.Model):
  title = models.CharField(max_length=100)
  content = models.TextField()
  board_embed = models.EmbeddedModelField(
    model_container=Board,
  )
```
기본 드라이버 활용 models.py
```python
from djongo import models

class Board(models.Model):
  title = models.CharField(max_length=100)
  objects = models.DjongoManager()
class Meta:
  managed = False
class Article(models.Model):
  title = models.CharField(max_length=100)
  content = models.TextField()
  board_embed = models.EmbeddedModelField(
    model_container=Board,
  )
  objects = models.DjongoManager()
```

## Node.js - Express
package.json
```json
{
  "body-parser": "~1.18.2",
  "cookie-parser": "~1.4.3",
  "debug": "~2.6.9",
  "ejs": "~2.5.7",
  "express": "~4.15.5",
  "mongoose": "^5.5.13",
  "morgan": "~1.9.0",
  "serve-favicon": "~2.4.5"
}
```
app.js에 몽고디비 연결
```js
var db = mongoose.connection;
db.on('error', console.error);
db.once('open', function(){
  // 연결 성공시 메시지 보내기
  console.log("Connected to mongod server");
});
mongoose.connect('mongodb://localhost/test', {useNewUrlParser: true});
```

boards.js
```js
var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var boardSchema = new Schema({
name: String
});
module.exports = mongoose.model('board', boardSchema);
```
article.js
```js
var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var articleSchema = new Schema({
  title: String,
  content: String
});
module.exports = mongoose.model('article', articleSchema);
```
### CRUD 명령 (page 215)
controllers/boardController.js 기본 세팅
```js
var Board = require('../models/board');
var Article = require('../models/article');
exports.create = function(req, res) {
  res.send('create');
};
exports.show = function(req, res) {
216
  res.send('show');
};
exports.update = function(req, res) {
  res.send('update');
};
exports.delete = function(req, res) {
  res.send('delete');
};
```
routes/board.js
```js
var express = require('express');
var boardController = require('../controllers/boardController');
var router = express.Router();
/* GET home page. */
router.get('/create', boardController.create);
router.get('/show', boardController.show);
router.get('/update', boardController.update);
router.get('/delete', boardController.delete);
module.exports = router;
```
app.js
```js
var index = require('./routes/index');
var users = require('./routes/users');
var board = require('./routes/board');
5장 웹 개발 환경에 연결하기 217
// ...(중략)...
// 라우트 연결하기
app.use('/', index);
app.use('/users', users);
app.use('/api/board', board);
// ...(생략)
```

## PHP - Laravel (page 223)
드라이버 설치
```shell
$ sudo apt-get install libcurl4-openssl-dev pkg-config libssl-dev
libsslcommon2-dev
$ sudo pecl install mongodb
```
pecl 설치
```shell
$ sudo apt install php-pear
$ sudo apt install php7.X-dev
```

config/database.php
```
'mongodb' => [
  'driver' => 'mongodb',
  'host' => env('DB_HOST', 'localhost'),
  'port' => env('DB_PORT', 27017),
  'database' => env('DB_DATABASE'),
  'username' => env('DB_USERNAME'),
  'password' => env('DB_PASSWORD'),
  'options' => [
  'database' => 'admin'
  ]
],
```
.env
```
DB_CONNECTION=mongodb
DB_HOST=127.0.0.1
DB_PORT=27017
DB_DATABASE=laravel_dev
DB_USERNAME=
DB_PASSWORD=
```
기본 모델 Article   
app/Article.php
```php
<?php
namespace App;
use Jenssegers\Mongodb\Eloquent\Model as Eloquent;
class Article extends Eloquent
{
//
}
```
기본 모델 Board 
app/Board.php
```php
<?php
namespace App;
use Jenssegers\Mongodb\Eloquent\Model as Eloquent;
class Board extends Eloquent
{
//
}
```

## Ruby - Rails
신규 프로젝트 생성
```bash
$ rails new mongodb_project --skip-active-record
```
application.rb 수정
```ruby
require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"
```

