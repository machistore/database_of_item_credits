# item_credit_db
SQLite database template for recording data credits.     
データのクレジットを記録するためのSQLiteで作成されたデータベースのテンプレート.

# DEMO


# Features
A SQLite database template that allows you to aggregate source data such as items as simply as possible.    
できるだけシンプルにアイテムなどのソースデータを集計できるようにするためのSQLiteによるデータベースのテンプレート.

# table list テーブルリスト
|Table Name<br>テーブル名|Description<br>説明|
|:---:|:---:|
|authors<br>著作者|authors details<br>著作者の詳細|
|item_types<br>アイテムの種類|Data types such as textures<br>テクスチャなどデータの種類|
|items<br>アイテム|item details<br>アイテムの詳細|
|publishers<br>パブリッシャー|publisher details<br>パブリッシャーの詳細|
|terms<br>利用規約|terms details<br>利用規約の詳細|
|works<br>作品|work details<br>作品の詳細|

## **author** table 著作者テーブル

|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|author_name|TEXT|0||0|
|2|url|TEXT|0||0|
|3|contacts|TEXT|0||0|

0. id(Primary key)
1. author
    + Author name
    + 著作者の名前
1. url
    + URL of copyright website, etc.
    + 著作者のウェブサイトなどのURL
1. contacts
    + Author contact
    + 著作者の連絡先

## **item_types** table

|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|type|TEXT|0||0|

0. id(Primary key)
1. type
    + Item type (e.g. textures etc.)
    + アイテムのタイプ(例:テクスチャ など)

## **items** table

|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|item_type_id|INTEGER|0||0|
|2|item_name|TEXT|0||0|
|3|author_id|INTEGER|0||0|
|4|publication_year|INTEGER|0||0|
|5|source_title|TEXT|0||0|
|6|publiser_id|INTEGER|0||0|
|7|url|TEXT|0||0|
|8|created_at|TEXT|0|strftime('Retrieved %Y-%m-%d', date('now', 'localtime'))|0|
|9|terms_id|INTEGER|0||0|
|10|memo|TEXT|0||0|

0. id(Primary key)
1. item_type_id
    + See "item_type_id" for details.
    + 詳細は"item_type_id"を参照してください.
1. item_name
    + Item name
    + アイテムの名前
1. author_id
    + See "author_id" for details.
    + 詳細は"author_id"を参照してください.
1. publication_year
    + Publication year
    + 発行年
1. source_title
    + Website title for the item, etc.
    + アイテムのウェブサイトのタイトルなど
1. publisher_id
    + See "publisher_id" for details.
    + 詳細は"publisher_id"を参照してください.
1. url
    + e.g. Website URL for "source_title"
    + "source_title"のウェブサイトのURLなど.
1. created_at
    + The date the data was retrieved.
    + データを取得した日付.
1. terms_id
    + See "terms_id" for details.
    + 詳細は"terms_id"を参照してください.
1. memo
    + A memo field where you can write anything, such as a summary of the data.
    + データのまとめなど、何でも書き込めるメモ欄.

## **publishers** table
|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|publisher_name|TEXT|0||0|
|2|url|TEXT|0||0|
|3|contacts|TEXT|0||0|

0. id(Primary key)
1. publisher_name
    + Publisher name
    + パブリッシャーの名前
1. url
    + URL of publisher
    + パブリッシャーのURL
1. contacts
    + Publisher contact.
    + パブリッシャーの連絡先.

## **terms** table

|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|terms_name|TEXT|0||0|
|2|conditions|TEXT|0||0|
|3|url|TEXT|0||0|
|4|created_at|TEXT|0|strftime('%Y年%m月%d日', date('now', 'localtime'))|0|
|5|updated_at|TEXT|0|strftime('%Y年%m月%d日', date('now', 'localtime'))|0|

0. id(Primary key)
1. terms_name
    + terms name
    + 規約名
1. conditions
    + terms details
    + 利用規約の詳細
1. url
    + URL of the website where the contents of the terms are posted.
    + 規約の内容を掲載しているウェブサイトのURL.
1. created_at
    + 



## **work_a** table

|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|item_id|INTEGER|0||0|
|2|modification|INTEGER|0||0|
|3|location_of_use|TEXT|0||0|



# E-R diagram

# Requerement

# Installation

# Author

* Katsutoshi Machida
* Machi Store
* machi.mcd@gmail.com

# License

"marionette_palettes" is under [The MIT License](https://opensource.org/licenses/mit-license.php)(https://licenses.opensource.jp/MIT/MIT.html)

Copyright (c) 2022 Katsutoshi Machida