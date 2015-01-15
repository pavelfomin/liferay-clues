-- List all custom fields with their corresponding class names.
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
	t.name = 'CUSTOM_FIELDS'
;
