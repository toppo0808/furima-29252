## userテーブル
| Colum              | Type     | Option      |
|--------------------|----------|-------------|
| nickname           |string    | null: false |
| email              |string    | null: false |
| password           |string    | null: false |
| password-confirmed |string    | null: false |
| first-name         |string    | null: false |
| last-name          |string    | null: false |
| birthday           |date      | null: false |
| first-hurigana     |string    | null: false |
| last-hurigana      |string    | null: false |

### Association
has_many: items
has_many: buys, though: items
has_many: comments

## itemsテーブル
| Colum            | Type     | Option                         |
|------------------|----------|--------------------------------|
|item_name         |string    | null: false                    |
|item_explanation  |text      | null: false                    |
|category          |integer   | null: false                    |
|status            |integer   | null: false                    |
|prise             |integer   | null: false                    |
|user_id           |integer   | null: false, foreign_key: true |
|fee               |integer   | null: false                    |
|area              |integer   | null: false                    |
|date              |integer   | null: false                    |

### Association
belong_to: user
has_one: buy
has_many: comments

## buyテーブル
| Colum  | Type     | Option                         |
|--------|----------|--------------------------------|
| user   | integer  | null: false, foreign_key: true |
| items  | integer  | null: false, foreign_key: true |

### Association
belong_to: user
belong_to: item
has_one: user_address

## user_addressテーブル
| Colum            | Type     | Option                         |
|------------------|----------|--------------------------------|
| buy_id           | string   | null: false, foreign_key: true |
| prefectures      | string   | null: false                    |
| postal_code      | string   | null: false                    |
| city             | string   | null: false                    |
| house_number     | string   | null: false                    |
| building_number  | string   |                                |
| telephone_number | string   | null: false                    |

### Association
belong_to: buy

## comments 
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association
belong_to: users
belong_to: items