var express = require('express');
var app = express();
var mysql = require('mysql');
var mysql_config = require('./mysql_config.js');
var func = require('./main.js');

var mysqlConnection = mysql.createConnection(mysql_config.mySQLConfiguration());

app.get('/', function(req, res){

    var sql = 'SELECT * FROM courses LEFT JOIN course_sections ON course_sections.course_id = courses.id LEFT JOIN departments ON departments.id = courses.department_id LEFT JOIN course_terms ON course_sections.courseterm_id = course_terms.id';

    //Key relations, Define each table's primary and foreign keys
    var nestingOptions = [
        { tableName : 'courses', pkey: 'id', fkeys:[{table:'departments',col:'department_id'}]},
        { tableName : 'course_sections', pkey: 'id', fkeys:[{table:'courses',col:'course_id'},{table:'course_terms',col:'courseterm_id'}]},
        { tableName : 'departments', pkey: 'id'},
        { tableName : 'course_terms', pkey: 'id'}
    ];
    mysqlConnection.query({sql: sql, nestTables: true}, function (err, rows) {
        // error handling
        if (err){
            console.log('Internal error: ', err);
            res.send("Mysql query execution error!");
        }

        else {
            var nestedRows = func.convertToNested(rows, nestingOptions);
            // res.send(JSON.stringify(nestedRows));
            res.send(nestedRows);
        }

    });

});

app.listen('8081');
console.log('Magic happens on port 8081');
exports = module.exports = app;