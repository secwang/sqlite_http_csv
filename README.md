# sqlite_http_csv

sqlite aim to simulation kdb+ http behavior for sqlite.

Provide the following functions.
1. bind sqlite to port
2. provid baisc http support
3. support dynamic csv name and query

behavior like this. It's very useful to import data into excel or google sheets.

localhost:5000/a.csv?select * from t where sym = "a"

# tech detail

will use tcl' wapp and sqlite as basic framework.
because it's lightweight and suited for sqlite
