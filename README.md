# database_of_item_credits
This is a table template for efficiently storing credit data such as assets, materials, and textures used in a work as a relational database.  
I made it for the purpose of displaying a list of credit notation using SQLite etc.  

作品内で使用したアセット、マテリアル、テクスチャなどのクレジットデータをリレーショナルデータベースとして効率的に保存するためのテーブルのテンプレートです.  
SQLiteなどを使ってクレジット表記を一覧表示する目的で作りました.

# Demo
＊This demonstration uses "[DB Browser for SQLite](https://sqlitebrowser.org/)" to visualize the database.  
＊このデモンストレーションでは"[DB Browser for SQLite](https://sqlitebrowser.org/)"を使用してデータベースを視覚化しています.

Here's a tabulated list of credits for items used.  
使用したアイテムのクレジット一覧を集計して表にしたところ.


![item_credit_db2](https://user-images.githubusercontent.com/104885577/209273482-ca1c2c0a-9998-4c10-b593-02fc8b6a5a6b.png)

![item_credit_db](https://user-images.githubusercontent.com/104885577/209272934-2986e98c-aab2-4fa9-a454-b7a0dd0951d0.png)


# Features
The "item_credit.sql" file contains SQL data as an example of aggregation.  

「item_credit.sql」ファイルには、集計の例として SQL データが含まれています.

# Table list テーブルリスト
||Table Name<br>テーブル名|Description<br>説明|
|:---:|:---:|:---:|
|table 1|authors<br>著作者|authors details<br>著作者の詳細|
|table 2|item_types<br>アイテムの種類|Data types such as textures<br>テクスチャなどデータの分類|
|table 3|items<br>アイテム|item details<br>アイテムの詳細|
|table 4|publishers<br>パブリッシャー|publisher details<br>パブリッシャーの詳細|
|table 5|terms<br>利用規約|terms details<br>利用規約の詳細|
|table ex.|works<br>作品|work details<br>作品の詳細<br>＊ A table will be set up for each work.<br>＊ 作品ごとに1つづつテーブルを設けます.|


---

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

## **item_types** table アイテムタイプテーブル

|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|type|TEXT|0||0|

0. id(Primary key)
1. type
    + Item type (e.g. textures etc.)
    + アイテムのタイプ(例:テクスチャ など)

## **items** table アイテムテーブル

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
    + See "item types table" for details.
    + 詳細は"item types table"を参照してください.
1. item_name
    + Item name
    + アイテムの名前
1. author_id
    + See "authors table" for details.
    + 詳細は"authors table"を参照してください.
1. publication_year
    + Publication year
    + 発行年
1. source_title
    + Website title for the item, etc.
    + アイテムのウェブサイトのタイトルなど
1. publisher_id
    + See "publishers table" for details.
    + 詳細は"publishers table"を参照してください.
1. url
    + e.g. Website URL for "source_title"
    + "source_title"のウェブサイトのURLなど.
1. created_at
    + The date the data was retrieved.
    + データを取得した日付.
1. terms_id
    + See "terms table" for details.
    + 詳細は"terms table"を参照してください.
1. memo
    + A memo field where you can write anything, such as a summary of the data.
    + データの概要など、何でも書き込めるメモ欄.

## **publishers** table パブリッシャーテーブル
|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|publisher_name|TEXT|0||0|
|2|url|TEXT|0||0|
|3|contacts|TEXT|0||0|

0. id(Primary key)
1. publisher_name
    + Publisher name
    + プラットフォームやパブリッシャーの名前
1. url
    + URL of publisher
    + プラットフォームやパブリッシャーのURL
1. contacts
    + Publisher contact.
    + プラットフォームやパブリッシャーの連絡先.

## **terms** table 利用規約テーブル

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
    + The date the data was retrieved.
    + データを取得した日付.
1. updated_at
    + Date of data update.
    + データをアップデートした日付.

## **work_a** table 作品例Aテーブル

|cid|name|type|notnull|dflt_value|pk|
|---|---|---|---|---|---|
|0|id|INTEGER|1||1|
|1|item_id|INTEGER|0||0|
|2|adaptation|INTEGER|0||0|
|3|location_of_use|TEXT|0||0|

＊ A table will be set up for each work.  
＊ 作品ごとに1つづつテーブルを設けます.

0. id(Primary key)
1. item_id
    + See "items table" for details.
    + 詳細は"items table" を参照してください.
1. adaptation
    + Adapted or not.    
    Yes = 1  
    No = 0
    + 翻案の有無.  
    有り = 1  
    無し = 0
1. location_of_use
    + Item usage.
    + アイテムの使用箇所.

# E-R diagram
![item_credit_ERd](https://user-images.githubusercontent.com/104885577/209269887-cdbf7968-ee3d-4f93-9dd5-cc901b01d5d6.png)

# Requerement

An environment that can operate SQLite is required.

SQLiteが動作する環境が必要です。

# Installation

nzip the zip file downloaded from "[Release](https://github.com/machistore/database_of_item_credits/releases)" and open the "item_redit.db" file in the "item_credit" folder with "[DB Browser for SQLite](https://sqlitebrowser.org/)".  
Or, use SQLite from a command prompt. 

「[Release](https://github.com/machistore/database_of_item_credits/releases)」からダウンロードしたzipファイルを解凍し、「item_credit」フォルダの中の「item_credit.db」ファイルを"[DB Browser for SQLite](https://sqlitebrowser.org/)"で開く、  
もしくはコマンドプロンプトなどからSQLiteをお使いください。  
# Author

* Katsutoshi Machida
* Machi Store
* machi.mcd@gmail.com

# License

"database_of_item_credits" is under [The MIT License](https://opensource.org/licenses/mit-license.php)(https://licenses.opensource.jp/MIT/MIT.html)

Copyright (c) 2022 Katsutoshi Machida
