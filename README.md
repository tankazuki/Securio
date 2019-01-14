
このアプリケーションはポートフォリオ用のデータです。

Ruby version "ruby 2.5.1p57 (2018-03-29 revision 63029)"

Ruby on rails version "Rails 5.2.2"

Use RDBMS "MySQL"


#テーブル設計

# README

## 1 Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname       |string |presence: true, length: { maximum: 20 }|
|mail           |string |presence: true, uniqueness: true, length: { maximum: 20 } |
|password_digest|string|presence: true, length: { minimum: 20 }|
|user_image     |text  |                                    |
|enable     |boolean  | あとでデフォルト値をdefault=trueに変更すること |

### Association


## 2 Camerasテーブル

|Column|Type|Options|
|------|----|-------|
|camera_name |string |presence: true, uniqueness: true, length: { maximum: 20 } |
|resolution  |integer|presence: true |
|camera_type |integer|presence: true |
|audio       |integer|presence: true |
|size        |string |presence: true |
|weight      |integer|presence: true, :numericality => { :less_than => 100 }|
|manufacturer_id |references| |

### Association


### Option
- add_foreign_key: :users, manufacturers
***
## 3 Reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|review_text  |text       |presence: true, length: { maximum: 200 }|
|review_image |text       ||
|user_id      |references ||
|camera_id    |references ||

### Association

### Option
- add_foreign_key: :reviews, users
- add_foreign_key: :reviews, cameras

***
## 4 Favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id      |references||
|camera_id    |references||


### Association

### Option
- add_foreign_key: :favorites, users
- add_foreign_key: :favorites, cameras
***

## 5 Impressionistsテーブル

|Column|Type|Options|
|------|----|-------|
||||

### Association

***

## 6 Reportsテーブル

|Column|Type|Options|
|------|----|-------|
|report_text|text|presence: true, length: { maximum: 200 }|
|user_id  |references||
|camera_id  |references||

### Association

### Option
- add_foreign_key: :reports, users
- add_foreign_key: :reports, cameras
***

## 7 Codecsテーブル

|Column|Type|Options|
|------|----|-------|
|codec   |string|presence: true, uniqueness: true|


### Association

***

## 8 CameraCodecsテーブル

|Column|Type|Options|
|------|----|-------|
|codec_id  |references||
|camera_id  |references||

### Association

### Option
- add_foreign_key: :camera_codecs, users
- add_foreign_key: :camera_codecs, cameras
***
## 9 CameraImagesテーブル

|Column|Type|Options|
|------|----|-------|
|camera_image|text||
|camera_id  |references||

### Association

### Option
- add_foreign_key: :camera_images, cameras

***
## 9 Manufacturersテーブル

|Column|Type|Options|
|------|----|-------|
|manufacturer_name|string|presence: true, unique: true|

### Association

***
