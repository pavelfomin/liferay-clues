-- select the market place account record
select 
	   t.tableid,
	   t.companyid,
	   t.classnameid,
	   v.rowid_,
	   n.name,
	   c.value,
	   v.data_
  from expandoTable t
  join expandoValue v
    on v.tableid = t.tableid
    and v.companyid = t.companyid
    and v.classnameid = t.classnameid
  join classname_ c
    on c.classnameid = t.classnameid
  join expandoColumn n
    on n.tableid = t.tableid
    and n.companyid = t.companyid
    and n.columnid = v.columnid
 where 
	t.name = 'MP'
;

-- delete the market place account record
 delete 
 from expandoValue 
 where tableid in 
 	(select tableid from expandoTable where name = 'MP')
;

/*
 * Once the record is removed from expandoValue, the "No channel exists with user id" is thrown and recorded in the log until new account is setup.
 */
