# README

# users
| column              | Type    | options                     |
| ------------------- | ------- | --------------------------- |
| nickname            | string  | null: false                 |
| email               | string  | null: false, unique: true   |
| encrypted_password  | string  | null: false                 |
| family_name         | string  | null: false                 |
| first_name          | string  | null: false                 |
| family_name_kana    | string  | null: false                 |
| first_name_kana     | string  | null: false                 |
| birthday            | date    | null: false                 |

# association
- has_many :items
- has_many :orders, dependent: :destroy



# items
| column          | Type      | options                       |
|---------------- | --------- |------------------------------ |
| name            | string    | null: false                   |
| description     | text      | null: false                   |
| category_id     | integer   | null: false                   |
| status_id       | integer   | null: false                   |
| cost_id         | integer   | null: false                   |
| prefecture_id   | integer   | null: false                   |
| day_id          | integer   | null: false                   |
| price           | integer   | null: false                   |
| user_id         | integer   | null: false, foreign_key: true|

# association
- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :cost
- belongs_to :prefecture
- belongs_to :day
- has_one :order



# orders
| column    | Types        | options                          |
|---------- | ------------ | -------------------------------- |
| user      | references   | null: false, foreign_key: true   |
| item      | references   | null: false, foreign_key: true   |

# association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address



# shipping_addresses
| column          | Type      | options                           |
|---------------- | --------- | --------------------------------- |
| postal_code     | string    | null: false                       |
| prefecture_id   | integer   | null: false                       |
| city            | string    | null: false                       |
| address         | string    | null: false                       |
| building        | string    |                                   |
| telephone       | string    | null: false                       |
| order_id        | integer   | null: false, foreign_key: true    |

# association
- belongs_to :order