# node-mysql-nesting

Converts mysql query result array (flat) to nested (multi-dimensional) object.

[![npm version](https://badge.fury.io/js/node-mysql-nesting.svg)](https://badge.fury.io/js/node-mysql-nesting)

## About

MySQL returns flat objects.  We want to nest joined objects.

Let's say we have courses table, each course belongs to a department and has various course sections. We would like to have a resulting courses array that has a department object property within it and have a list of course sections.

## Usage

node-mysql library function mysqlConnection.query() takes 2 parameters: sql options and a callback function. 

Instead of this:

```javascript 
mysqlConnection.query(sqlString, function (err, rows) {});
```

Use this:

```javascript 
var options = { sql: sqlString, nestTables: true };
mysqlConnection.query(options, function (err, rows) {});
```

As you can see, we set nestTables to true. Taken from node-mysql documentation:

> By default, node-mysql will overwrite colliding column names in the order the columns are received from MySQL, causing some of the received values to be unavailable. However, you can also specify that you want your columns to be nested below the table name by using nestTable.

After setting nestTables to true, result array will be something like this:

```javascript 
[{
    table1: {
      fieldA: '...',
      fieldB: '...',
    },
    table2: {
      fieldA: '...',
      fieldB: '...',
    },
  }, ...]
```

Here is our SQL statement:

```sql
SELECT * FROM courses 
LEFT JOIN course_sections ON course_sections.course_id = courses.id 
LEFT JOIN departments ON departments.id = courses.department_id 
LEFT JOIN course_terms ON course_sections.courseterm_id = course_terms.id';
```

You should use joins instead of WHEREs and ANDs in order to get related columns even if they have NULL value.

Then, we create nesting options array and push objects that has 'tableName' and 'key' properties and database table name and primary key column names as values of those  properties. node-mysql-nested function will use those to produce nested javascript object.

```javascript
    var nestingOptions = [
        { tableName : 'courses', pkey: 'id', fkeys:[{table:'departments',col:'department_id'}]},
        { tableName : 'course_sections', pkey: 'id', fkeys:[{table:'courses',col:'course_id'},{table:'course_terms',col:'courseterm_id'}]},
        { tableName : 'departments', pkey: 'id'},
        { tableName : 'course_terms', pkey: 'id'}
    ];
``` 

Please make sure that table names are in the same order as in your SQL statement. Otherwise it won't work.

Now, it is time to use our beloved function!

```javascript
mysqlConnection.query(options, function (err, rows) {
    
    var nestedRows = func.convertToNested(rows, nestingOptions);
    
    res.send(JSON.stringify(nestedRows));

});
```

And, this is it! Try to run example code to see the result.


## Example

To illustrate how this function works, I included a simple application to the package. 

* node.js express app (under /server directory)
* mysql database (node-mysql-nested.sql)

### Installation

* Create a new database and import ***sql/node-mysql-nesting.sql***.

* Rename mysql_config.example.js to mysql_config.js and update it with your mysql configuration

* Install dependencies: `npm install`. This will install express and node-mysql.

* Start the node server: `node app.js` (if you don't have nodejs installed, go to: http://nodejs.org/)

* Now, open your browser and go to `http://localhost:8081`. You should be able to see a nested result object.

## Contact

 - Kyle Ladd - ([http://kyleladd.us](http://kyleladd.us)) - (kladd6@gmail.com)