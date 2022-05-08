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
has_many :items
has_one :buyer, dependent: :destroy



# items
| column          | Type      | options       |
|---------------- | --------- |-------------- |
| name            | string    | null: false   |
| description     | text      | null: false   |
| category_id     | integer   | null: false   |
| status_id       | integer   | null: false   |
| cost_id         | integer   | null: false   |
| prefecture_id   | integer   | null: false   |
| days_id         | integer   | null: false   |
| price           | integer   | null: false   |

# association
belongs_to :user



# buyers
| column          | Type      | options                           |
|---------------- | --------- | --------------------------------- |
| user_id         | integer   | null: false, foreign_key: true    |
| postal_code     | string    | null: false                       |
| prefecture_id   | integer   | null: false                       |
| city            | string    | null: false                       |
| address         | string    | null: false                       |
| building        | string    |                                   |
| telephone       | string    | null: false                       |

# association
belongs_to :user