## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|

### Association
- has_many : addresses
- has_many : orders, through: :addresses
- has_many : plans, through: :likes
- has_many : likes

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|full_name|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|tel|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user
- has_many : orders

## plansテーブル

|Column|Type|Options|
|------|----|-------|
|producer|string|null: false|
|area|string|null: false|
|dead_line|string|null: false|
|img_url|text||
|title|text||
|avatar|text||

### Association
- has_many : courses
- belongs_to : category
- has_many : users, through: :likes
- has_many : likes

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|

### Association
- has_many :plans

## coursesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|plan_id|references|null: false, foreign_key: true|

### Association
- belongs_to : plan
- has_many : orders

## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|quantity|integer|null: false|
|address_id|references|null: false, foreign_key: true|
|course_id|references|null: false, foreign_key: true|

### Association
- belongs_to : course
- delegate_to : user, to: :address
- belongs_to : address

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|:user, null: false, foreign_key: true|
|plan_id|references|:plan, null: false, foreign_key: true|

### Association
- belongs_to : user
- belongs_to : plan
