<#--
	The velocity variables available in Web Content are defined in JournalStructureConstants class.
	Freemarker interprets '-' in the variable name as the mathematical subtraction operator.	
	To access them from the FM template, the vars method needs to be used.
-->

${.vars['reserved-article-title'].data}
