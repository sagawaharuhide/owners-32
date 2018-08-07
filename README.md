## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|

### Association
- has_many : owner_deliveries

## user_deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|address1|string|null: false|
|address2|integer|null: false|
|tel|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user
- has_many : orders

## plansテーブル

|Column|Type|Options|
|------|----|-------|
|producer|string|null: false|
|area|string|null: false|
|dead_line|date|null: false|

### Association
- has_many : courses

## coursesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|plan_id|references|null: false, foreign_key: true|

### Association
- belongs_to : plan
- has_many : order_details
- has_many : orders, through: :order_details

## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|owner_delivery_id|references|null: false, foreign_key: true|

### Association
- has_many : order_details
- has_many : courses, through: :order_details
- delegate_to : user, to: :owner_delivery
- belongs_to : owner_delivery

## order_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|course_id|references|null: false, foreign_key: true|
|order_id|references|null: false, foreign_key: true|

### Association
- belongs_to : order
- belongs_to : course
