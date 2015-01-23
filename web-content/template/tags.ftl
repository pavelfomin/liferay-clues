<#--
	Show the list of the tags that are relevant for a particular class of assets.
	In the example below, restrict the tags list for ones used by the com.liferay.portlet.journal.model.JournalArticle only.
-->
<#assign AssetTagLocalService = serviceLocator.findService("com.liferay.portlet.asset.service.AssetTagLocalService")>
<#assign classNameLocalService = serviceLocator.findService("com.liferay.portal.service.ClassNameLocalService")>
<#assign journalArticleClassNameId = classNameLocalService.getClassNameId("com.liferay.portlet.journal.model.JournalArticle")>

<#assign tags = AssetTagLocalService.getTags(groupId, journalArticleClassNameId, "%")>

<div>
    <#list tags as tag>
        <a>${tag.name}</a>
    </#list>
</div>
