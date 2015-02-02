-- Start with a fresh db by deleting the tables.
-- If images are stored on the filesystem then that directory needs to be cleaned up as well.
-- Start one node of Liferay at first to make sure that the tables creation is performed correctly. 
select 
	'drop table '||table_name ||';' 
  from user_tables
;