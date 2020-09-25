## userテーブル
| Colum              | Type     | Option      |
|--------------------|----------|-------------|
| nickname           |string    | null: false |
| email              |string    | null: false |
| password           |string    | null: false |
| first-name         |string    | null: false |
| last-name          |string    | null: false |
| birthday           |date      | null: false |
| first-furigana     |string    | null: false |
| last-furigana      |string    | null: false |

### Association
has_many: items
has_many: buys
has_many: comments

## itemsテーブル
| Colum            | Type     | Option                         |
|------------------|----------|--------------------------------|
|image             |text      | null: false                    |
|name              |string    | null: false                    |
|explanation       |text      | null: false                    |
|category_id       |integer   | null: false                    |
|status_id         |integer   | null: false                    |
|prise             |integer   | null: false                    |
|user_id           |integer   | null: false, foreign_key: true |
|fee_id            |integer   | null: false                    |
|area_id           |integer   | null: false                    |
|date_id           |integer   | null: false                    |

### Association
belongs_to: user
has_one: buy
has_many: comments

## buyテーブル
| Colum  | Type     | Option                         |
|--------|----------|--------------------------------|
| user_id| integer  | null: false, foreign_key: true |
| item_id| integer  | null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item
has_one: user_address

## user_addressesテーブル
| Colum            | Type     | Option                         |
|------------------|----------|--------------------------------|
| buy_id           | integer  | null: false, foreign_key: true |
| prefectures      | integer  | null: false                    |
| postal_code      | string   | null: false                    |
| city             | string   | null: false                    |
| house_number     | string   | null: false                    |
| building_number  | string   |                                |
| telephone_number | string   | null: false                    |

### Association
belongs_to: buy

## comments 
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item