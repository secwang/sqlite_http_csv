# sqlite_http_csv

sqlite aim to simulation kdb+ http behavior for sqlite.

Provide the following functions.
1. bind local sqlite to port
2. provid basic http support
3. support dynamic csv name and query

behavior like this. It's very useful to import data into excel or google sheets.

localhost:5000/a.csv?select * from t where sym = "a"

# tech detail

will use tcl wapp and sqlite as basic framework.  
because it's lightweight and suited for sqlite


# usage 
use activetcl install tcl. 

tclsh main.tcl -DDBFILE=test.db --server 8000
```
curl 'http://localhost:8000/a.csv?select * from t'
```
```
curl -vvvv 'http://localhost:8000/a.csv?select%20*%20from%20t%20limit%201'
```
