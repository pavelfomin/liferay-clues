<#--
	Generate links in an application template properly to support pages requested using both virtual host and /web/.
	The urlPath can be then concatenated with the page friendy url.  
-->
<#assign currentPageIndex = currentURL?last_index_of("/")>
<#assign urlPath = currentURL?substring(0, currentPageIndex)>
