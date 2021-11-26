<h4 align="center"> 
  <img alt="DATABASES" src="https://download.pingcap.com/images/blog/choosing-right-database-for-your-applications.png" width="500"> 
</h4>
<h2 align="center"> Database Administration </h2>

***Result of task 4*** <br>

<details><summary>PART 1</summary><br>
1. <a href="https://www.mysql.com/downloads/">Download</a> MySQL server for your OS on VM.<br>
2. <a href="https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04-ru">Install</a> MySQL server on VM (Ubuntu 20.04).

  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/install%20mysql_server.png"> <br>
3. Select a subject area and describe the database schema, (minimum 3 tables). <br>
4. Create a database on the server through the console. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Database.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Tables.png"> <br>
  
5. Fill in tables. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/All_Tables.png"> <br>
  
6. Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Select.png"> <br>

7. Execute other different SQL queries DDL, DML, DCL. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Insert.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Insert_2.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Delete.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Delete.png"> <br>
  
8. Create a database of new users with different privileges. Connect to the database as a new user and verify that the privileges allow or deny certain actions. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/New_DB.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Users.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Grants_For_Admin.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Grants_For_test.png"> <br>
  
9. Make a selection from the main table DB MySQL. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Denided.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Denided1.png"> <br>
</details>

<details><summary>PART 2</summary><br>

10. Make backup of your database. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/BackUp_Create.png"> <br>
  
11. .Delete the table and/or part of the data in the table. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Drop_Table.png"> <br>
  
12. Restore your database. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Restore_BackUp.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Result_restore.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/DB_Restor_On_RDS.png"> <br>
  
13. Transfer your local database to RDS AWS. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/RDS.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Import_DB_to_RDS.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Import_Finish.png"> <br>
  
14. Connect to your database. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Connect_To_RDS.png"> <br>
  
15. Execute SELECT operator similar step 6. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Select1_RDS.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Select2_RDS.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Select3_RDS.png"> <br>
  
16. Create the dump of your database. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/SnapShot_DB1.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Get_Dump_from_RDS.png"> <br>
</details>

<details><summary>PART 3</summary><br>

17. Create an Amazon DynamoDB table. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/DynamoDB_AWS.png"> <br>
  
18. Enter data into an Amazon DynamoDB table. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Items_Dynamo_DB.png"> <br>
  
19. Query an Amazon DynamoDB table using Query and Scan. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Scan_Dynamo.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Query1_Dynamo.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m4/Task4.1/IMG/Query2_Dynamo.png"> <br>
</details>
