ALTER EXTENSION bitstring_helpers ADD FUNCTION shuffled_ints(bigint);
ALTER EXTENSION bitstring_helpers ADD FUNCTION popcount(bit varying);
ALTER EXTENSION bitstring_helpers ADD FUNCTION hamming_distance(bit varying,bit varying);
ALTER EXTENSION bitstring_helpers ADD FUNCTION neighbours(bit varying);
ALTER EXTENSION bitstring_helpers ADD CAST (text AS bit varying);
ALTER EXTENSION bitstring_helpers ADD FUNCTION text2bitstring(text);
ALTER EXTENSION bitstring_helpers ADD CAST (bit varying AS text);
ALTER EXTENSION bitstring_helpers ADD FUNCTION bit2text(bit varying);
--ALTER EXTENSION bitstring_helpers ADD FUNCTION textarray2bitvaryingarray(text[]);
--ALTER EXTENSION bitstring_helpers ADD CAST (text[] AS bit varying[]);
ALTER EXTENSION bitstring_helpers ADD AGGREGATE aconcat (anyelement);
ALTER EXTENSION bitstring_helpers ADD AGGREGATE concat(text);
ALTER EXTENSION bitstring_helpers ADD AGGREGATE concat(bit);



