edge(0, 1, 5).
edge(0, 6, 11).
edge(7, 1, 6).
edge(7, 6, 9).
edge(1, 6, 3).
edge(1, 2, 7).
edge(1, 5, 5).
edge(6, 5, 2).
edge(2, 5, -1).
edge(2, 3, -8).
edge(5, 3, 9).
edge(5, 4, 1).
edge(3, 4, 10).
path(A, B, W) :- edge(A, B, W).
path(A, B, W) :- edge(B, A, W).

dfs(Start, Goal, Cost) :- dfs__(Start, Goal, Cost, []).

dfs__(Start, Goal, Cost, Visited) :- path(Start, Goal, W), Cost is W.
dfs__(Start, Goal, Cost, Visited) :- path(Start, A, W), not(member(A, Visited)), dfs__(A, Goal, Cost2, [Start|Visited]), Cost is W + Cost2.


bfs(U, V, Cost) :- bfs_search(V, [U], [], Searched), bfs_cost(Searched, [], V, Cost).

bfs_search(V, Queue, Visited, Searched) :- member(V, Queue), Searched is [V].
bfs_search(V, [Start|Queue], Visited, Searched) :-
    append(Visited, [Start], New_Visited),
    findall(A, (path(Start, A, _), not(member(A, New_Visited)), not(member(A, Queue))), New_Ele),
    append(Queue, New_Ele, New_Queue),
    bfs_search(V, New_Queue, New_Visited, Searched1),
    append([Start], Searched1, Searched).

bfs_cost([], _, _, 0).
bfs_cost([Start|Searched], Rest, V, Cost) :- 
    path(Start, V, W),
    bfs_cost(Rest, [], Start, New_Cost),
    Cost is W + New_Cost.
bfs_cost([Start|Searched], Rest, V, Cost):-
    append(Rest, [Start], New_Rest),
    bfs_cost(Searched, New_Rest, V, Cost).