reassign(_, [], []).
% Have to pass 0 as the first arguement in A when calling
reassign(A, [H|T], [A1|T1]) :- A1 is A + H, reassign(A1, T, T1). 
% reassign(A, [H|T], [A|T1]) :- A1 is A + H, reassign(A1, T, T1). 