# Data-Bases
Assignment of the course Data Bases (BSc in Artificial Intelligence and Data Science 2nd year, 1st semester)

## How to run the code?
You should follow the following example:

### Instalation of dependencies

#### Python 3, pip and python libraries
```
sudo apt-get install python3 python3-pip
```
```
pip3 install --user Flask==1.1.4 PyMySQL==1.0.2 cryptography==36.0.0
```
### Settings of the DB
Edit the db.py file regarding your DB configuration, modifying the parameters DB (database name), USER (username), and PASSWORD (user password).

Test the access by executing:
```
python3 test_db_connection.py TABLE_NAME
```

If the database access configuration is correct, the contents of the TABLE_NAME table should be listed. For example, the REGION table from the MovieStream database:

```
$ python3 test_db.py REGION
SELECT * FROM REGION
5 results ...
{'RegionId': 6, 'Name': 'Other countries', 'RegionManager': 17}
{'RegionId': 7, 'Name': 'America', 'RegionManager': 16}
{'RegionId': 8, 'Name': 'Asia', 'RegionManager': 15}
{'RegionId': 9, 'Name': 'Europe', 'RegionManager': 17}
{'RegionId': 10, 'Name': 'Africa', 'RegionManager': 15}
```

### Execution

Start the application by running python3 server.py and interact with it by opening a window in your browser with the address http://localhost:9001/

```
$ python3 server.py
2021-11-27 15:07:33 - INFO - Connected to database movie_stream
 * Serving Flask app "app" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
2021-11-27 15:07:33 - INFO -  * Running on http://0.0.0.0:9001/ (Press CTRL+C to quit)
SELECT COUNT(*) AS movies FROM MOVIE
2021-11-27 15:07:37 - INFO - SQL: SELECT COUNT(*) AS movies FROM MOVIE Args: None
SELECT COUNT(*) AS actors FROM ACTOR
2021-11-27 15:07:37 - INFO - SQL: SELECT COUNT(*) AS actors FROM ACTOR Args: None
```

