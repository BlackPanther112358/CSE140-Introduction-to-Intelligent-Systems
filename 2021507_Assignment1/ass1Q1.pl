find(P, [P|T], 1).
find(P, [_|T], U) :- find(P, T, V), U is V + 1.

len([], 0).
len([_|T], X) :- len(T, Y), X is Y + 1.