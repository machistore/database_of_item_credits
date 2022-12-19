SELECT work_a.id AS "ID" 
		,items.item_name AS "Item"
		,item_types.type AS "Type"
		,authors.author_name AS "Author"
		,publishers.publisher_name AS "Publisher"
		,items.source_title AS "Source Title"
		,items.url AS "URL"
		,items.created_at AS "Retrieved"
		,work_a.location_of_use AS "Location"

FROM work_a

INNER JOIN items ON work_a.item_id = items.id --Joined "items table"
INNER JOIN authors ON items.author_id = authors.id --Joined "author table"
INNER JOIN publishers ON items.publiser_id = publishers.id --Joined "publisher table"
INNER JOIN item_types ON items.item_type_id = item_types.id --Joined "item_types table"
;