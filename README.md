## usersテーブル
| Colum              | Type     | Option      |
|--------------------|----------|-------------|
| nickname           |string    | null: false |
| email              |string    | null: false |
| password           |string    | null: false |
| password-confirmed |string    | null: false |
| name               |string    | null: false |
|birthday            |integer   | null: false |

### Association
has_many: items
has_many: buy, though: items
has_many: comments

## itemsテーブル
| Colum            | Type     | Option                         |
|------------------|----------|--------------------------------|
|item_name         |string    | null: false                    |
|item_explanation  |text      | null: false                    |
|category          |integer   | null: false                    |
|status            |integer   | null: false                    |
|prise             |integer   | null: false                    |
|user              |integer   | null: false, foreign_key: true |

### Association
belong_to: users
has_one: buy
has_many: comments

## buyテーブル
| Colum  | Type     | Option                         |
|--------|----------|--------------------------------|
| user   | integer  | null: false, foreign_key: true |
| items  | integer  | null: false, foreign_key: true |

### Association
belong_to: users
belong_to: items

## user_addressテーブル
| Colum            | Type     | Option                         |
|------------------|----------|--------------------------------|
| buy              | integer  | null: false, foreign_key: true |
| postal_code      | integer  | null: false                    |
| city             | integer  | null: false                    |
| house_number     | string   | null: false                    |
| building_number  | string   |                                |
| telephone_number | integer  | null: false                    |

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