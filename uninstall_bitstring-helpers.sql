DROP FUNCTION shuffled_ints(bigint);
DROP FUNCTION popcount(bit varying);
DROP FUNCTION hamming_distance(bit varying,bit varying); 
DROP FUNCTION neighbours(bit varying); 
DROP CAST (text AS bit varying); 
DROP FUNCTION text2bitstring(text); 
DROP CAST (bit varying AS text); 
DROP FUNCTION bit2text(bit varying); 
--DROP FUNCTION textarray2bitvaryingarray(text[]); 
--DROP CAST (text[] AS bit varying[]); 
DROP AGGREGATE aconcat (anyelement); 
DROP AGGREGATE concat(text); 
DROP AGGREGATE concat(bit);

