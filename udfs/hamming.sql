CREATE OR REPLACE FUNCTION hamming(s1 varchar, s2 varchar) RETURNS integer IMMUTABLE AS $$
import array

# https://stackoverflow.com/questions/31007054/hamming-distance-between-two-binary-strings-not-working
def hamming(s1, s2):
    if not s1 or not s2:
        return None
    if len(s1) != len(s2):
        return None
    bytesS1 = bytes(s1)
    bytesS2 = bytes(s2)
    diff = 0
    for a,b in zip(array.array('B',bytesS1), array.array('B',bytesS2)):
        if a^b != 0:
            diff += 1;
    return diff

return hamming(s1, s2)
$$ language plpythonu;
