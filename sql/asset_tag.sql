-- select all tags with the associated asset entries
select 
       t.tagid,
       t.groupId,
       t.name,
       t.assetCount,
       e.entryId,
       e.title,
       e.classnameid,
       c.value
  from AssetTag t
  join AssetEntries_AssetTags et 
    on et.tagId = t.tagId
  join AssetEntry e
    on e.entryid = et.entryid
    and e.visible = 1 
  join classname_ c
    on c.classnameid = e.classnameid
;
