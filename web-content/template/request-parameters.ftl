<#--
	The request here is not the original request and doesn't contain the url query parameters. 
	hence the usage of the serviceContext from ServiceContextThreadLocal.
-->

<#--
	Obtain the request parameter using serviceContext from ServiceContextThreadLocal.
-->
 
<#assign serviceContext = staticUtil["com.liferay.portal.service.ServiceContextThreadLocal"].getServiceContext()>
<#assign httpServletRequest = serviceContext.getRequest()>
myparam="${(httpServletRequest.getParameter('myparam')?html)!''}"

<#--
    Obtain the request parameter using the url parsing.
-->
<#assign url = request.attributes['CURRENT_URL']>
myparam = ${httpUtil.getParameter(url, "myparam", false)}