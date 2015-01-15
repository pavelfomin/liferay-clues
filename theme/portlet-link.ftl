<#--
	Add portlet action link to the theme using freemarker.
	myportlet is the portlet id
	myportletswar is the plugin name deployed in Liferay as a war file
-->

<#assign searchPortletId = "myportlet_WAR_myportletswar">
<#assign searchActionLayoutId = portalUtil.getPlidFromPortletId(scopeGroupId, false, searchPortletId)>
<#assign searchActionURL = portletURLFactory.create(request, searchPortletId, searchActionLayoutId, "ACTION_PHASE")>

<form id="search" method="post" action="${searchActionURL}">
<#-- required by portal -->
	<input id="p_p_state" name="p_p_state" value="normal" type="hidden">
	
	<#-- required by portlet action -->
	<input id="page" name="page" value="0" type="hidden">
	<input id="size" name="size" value="20" type="hidden">
	<input id="searchTerm" name="searchTerm" type="text">
</form>
