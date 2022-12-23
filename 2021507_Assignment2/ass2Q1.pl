trip(Length, Budget, Type) :- Budget < 100000, Type = 'Domestic_short'.
trip(Length, Budget, Type) :- Length > 5, Budget >= 100000, Budget < 200000, Type = 'Domestic_long'.
trip(Length, Budget, Type) :- Length > 5, Budget >= 200000, Budget < 500000, Type = 'International_short'.
trip(Length, Budget, Type) :- Length > 15, Budget >= 500000, Type = 'International_long'.

destination(Type, Location, Place) :- Type == 'Domestic_short', Location == 'hill station', Place = 'Manali, Shimla'.
destination(Type, Location, Place) :- Type == 'Domestic_short', Location == 'nature', Place = 'Ranthambore, Sariska'.
destination(Type, Location, Place) :- Type == 'Domestic_short', Location == 'historic', Place = 'Udaipur, Jaipur'.
destination(Type, Location, Place) :- Type == 'Domestic_long', Location == 'beaches', Place = 'Kerela, Pondicherry'.
destination(Type, Location, Place) :- Type == 'Domestic_long', Location == 'party', Place = 'Goa, Mumbai'.
destination(Type, Location, Place) :- Type == 'Domestic_long', Location == 'nature', Place = 'Assam, Jammu and Kasmir'.
destination2(Type, Weather, Activities, Place) :- Type == 'International_long', Weather == 'cool', Activities == 'sightseeing', Place = 'Switzerland, Canada'.
destination2(Type, Weather, Activities, Place) :- Type == 'International_long', Weather == 'cool', Activities == 'historic', Place = 'Venice, Florence'.
destination2(Type, Weather, Activities, Place) :- Type == 'International_long', Weather == 'cool', Activities == 'urban', Place = 'Paris, London'.
destination2(Type, Weather, Activities, Place) :- Type == 'International_long', Weather == 'moderate', Activities == 'urban', Place = 'California, Hong Kong'.
destination2(Type, Weather, Activities, Place) :- Type == 'International_short', Weather == 'moderate', Activities == 'urban', Place = 'Bangkok, Sydney'.
destination2(Type, Weather, Activities, Place) :- Type == 'International_short', Weather == 'moderate', Activities == 'historic', Place = 'Nepal, Bhutan'.
destination2(Type, Weather, Activities, Place) :- Type == 'International_short', Weather == 'cool', Activities == 'sightseeing', Place = 'Maldives, Indonesia'.

start:-
    write('Please enter your name: '), nl,
    read(Name), nl,
    write('Hello, '), write(Name), write(' Please also tell more about yourself.'), nl,
    write('Please enter the expected duration:'),
    read(Length), nl,
    write('Please enter your budget for the trip:'),
    read(Budget), nl,
    trip(Length, Budget, Type),
    % write(Length), nl, write(Budget), nl, write(Type), nl,
    (
        Type == 'Domestic_short'->
        write('Please enter the type of location you want to visit: '), nl, 
        read(Location), nl,
        destination(Type, Location, Place),
        write('You can try visiting: '), 
        write(Place)
        ;
        (
            Type == 'Domestic_long'->
            write('Please enter the type of location you want to visit: '), nl, 
            read(Location), nl,
            destination(Type, Location, Place),
            write('You can try visiting: '), 
            write(Place)
            ;
            (
                Type == 'International_short'->
                write('Please enter the type of weather you want to enjoy: '), nl, 
                read(Weather), nl,
                write('Please enter the type of activities you want to enjoy: '), nl, 
                read(Location), nl,
                destination2(Type, Weather, Activities, Place),
                write('You can try visiting: '), 
                write(Place)
                ;
                Type == 'International_long'->
                write('Please enter the type of weather you want to enjoy: '), nl, 
                read(Weather), nl,
                write('Please enter the type of activities you want to enjoy: '), nl, 
                read(Location), nl,
                destination2(Type, Weather, Activities, Place),
                write('You can try visiting: '), 
                write(Place)
            )
        )
    ).