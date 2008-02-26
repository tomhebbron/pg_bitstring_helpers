
-- Adjust this setting to control where the objects get created.
SET search_path = public;

CREATE OR REPLACE FUNCTION shuffled_ints(bigint) RETURNS bigint[] AS 'MODULE_PATHNAME', 'shuffled_ints' LANGUAGE C STRICT; 
COMMENT ON FUNCTION shuffled_ints(bigint) IS 'Create an array of user definable size ''n'' of shuffled integers (1 to n)';

CREATE OR REPLACE FUNCTION popcount(bit varying) RETURNS int AS 'MODULE_PATHNAME', 'popcount' LANGUAGE C STRICT IMMUTABLE; 
COMMENT ON FUNCTION popcount(bit varying) IS 'Count the number of 1''s in a bitstring'; 

CREATE OR REPLACE FUNCTION hamming_distance(bit varying,bit varying) RETURNS int AS $$
	SELECT popcount($1 # $2);
$$ LANGUAGE 'SQL' STRICT IMMUTABLE;
COMMENT ON FUNCTION hamming_distance(bit varying, bit varying) IS 'Calculate the hamming distance between two bitstrings';

CREATE OR REPLACE FUNCTION neighbours(bit varying) RETURNS SETOF bit varying AS $$
  SELECT $1 # (pg_catalog.bit(1,length($1)) << generate_series(0,length($1)-1,1));
$$ LANGUAGE 'SQL' STRICT IMMUTABLE;
COMMENT ON FUNCTION neighbours(bit varying) IS 'Return all the 1-bit mutation neighbours of the given bitstring';


--casts
CREATE OR REPLACE FUNCTION text2bitstring(text) RETURNS bit varying AS $$
	SELECT bit_in(textout('B'::text||$1),67,length($1));
$$ LANGUAGE 'SQL';
COMMENT ON FUNCTION text2bitstring(text) IS 'Convert text (contianing 1''s and 0''s only) to a bit varying type.';
CREATE CAST (text AS bit varying) WITH FUNCTION text2bitstring (text);

CREATE OR REPLACE FUNCTION bit2text(bit varying) RETURNS text AS $$
  SELECT textin(bit_out($1));
$$ LANGUAGE 'SQL';
COMMENT ON FUNCTION bit2text(bit varying) IS 'Convert bits to text';
CREATE CAST (bit varying AS text) WITH FUNCTION bit2text(bit varying);

/*
CREATE OR REPLACE FUNCTION textarray2bitvaryingarray(text[]) RETURNS bit varying[] AS $$
DECLARE
  out bit varying[];
BEGIN
	FOR i IN 1..array_upper($1, 1) LOOP
		IF (i=1) THEN
			out:=array[$1[i]::bit varying];
		ELSE
			out:=array_append(out,$1[i]::bit varying);
		END IF;
	END LOOP;
	RETURN out;
END;
$$ LANGUAGE 'plpgsql';
--select textarray2bitvaryingarray(array['010011','0010101','010100101100']);
CREATE CAST (text[] AS bit varying[]) WITH FUNCTION textarray2bitvaryingarray(text[]);
*/


--aggregates

CREATE AGGREGATE aconcat (
	BASETYPE = anyelement,
	SFUNC = array_append,
	STYPE = anyarray,
	INITCOND = '{}'
);

CREATE AGGREGATE concat(
	BASETYPE=text,
	SFUNC=textcat,
	STYPE=text
);

CREATE AGGREGATE concat(
	BASETYPE=bit,
	SFUNC=bitcat,
	STYPE=bit varying
);

