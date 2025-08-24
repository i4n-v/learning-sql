CREATE OR REPLACE FUNCTION no_empty_object_array(count BIGINT, json_input JSON) RETURNS JSON 
AS $$
	BEGIN
		IF count > 0 THEN
			RETURN json_input;
		ELSE 
			RETURN  '[]'::JSON;
		END IF;
	END;
$$
LANGUAGE plpgsql;

SELECT 
	cus.*,
	NO_EMPTY_OBJECT_ARRAY(
		COUNT(ord.id),
		JSON_AGG(
			JSON_STRIP_NULLS(
				JSON_BUILD_OBJECT(
				  'id', ord.id,
				  'amount', ord.amount
				)
			)
		)
	) AS orders
FROM customers AS cus
LEFT JOIN orders AS ord ON ord.customer_id = cus.id 
GROUP BY cus.id;

CREATE OR REPLACE FUNCTION empty_to_array(state JSONB, value ANYELEMENT) 
RETURNS JSONB
LANGUAGE plpgsql
AS $$
	BEGIN
		IF value IS NULL THEN
			state := '[]'::JSONB;
		ELSE 
			state := state || TO_JSONB(value);
		END IF;

		RETURN state;
	END;
$$;


CREATE OR REPLACE AGGREGATE json_agg_empty(anyelement) (
	SFUNC = empty_to_array,
    STYPE = JSONB,
    INITCOND = '[]'
);