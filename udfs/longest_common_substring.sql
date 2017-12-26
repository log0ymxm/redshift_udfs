CREATE OR REPLACE FUNCTION longest_common_substring(s1 varchar, s2 varchar) RETURNS integer IMMUTABLE AS $$
def longest_common_substring(s1, s2):
    if not s1 or not s2:
        return None
    m = [[0] * (1 + len(s2)) for i in range(1 + len(s1))]
    longest, x_longest = 0, 0
    for x in range(1, 1 + len(s1)):
        for y in range(1, 1 + len(s2)):
            if s1[x - 1] == s2[y - 1]:
                m[x][y] = m[x - 1][y - 1] + 1
                if m[x][y] > longest:
                    longest = m[x][y]
                    x_longest = x
            else:
                m[x][y] = 0
    return len(s1[x_longest - longest: x_longest])

return longest_common_substring(s1, s2)
$$ language plpythonu;
