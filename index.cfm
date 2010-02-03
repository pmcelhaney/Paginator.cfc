<cfparam name="url.page" default="1" type="numeric"/>

<cfset records = queryNew("col1,col2") />
<cfset queryAddRow(records, 135) />
                                                   
<cfset paginator = createObject("component", "Paginator").init(records.recordCount) />
<cfset paginator.setPageSize(10) /> 
<cfset paginator.setCurrentPage(url.page) /> 


 
<cfoutput>              
<cfloop index = "i" from = "#paginator.startRow()#" to = "#paginator.endRow()#">
  #i#<br>
</cfloop>                                    


      
<cfset pageNumbers = paginator.pageNumberList(5)/>	 

<cfif not paginator.isFirstPage()>
	<strong><a href="?page=#paginator.previousPage()#">&lsaquo; prev</a></strong>
	<cfif listGetAt(pageNumbers, 1) neq 1>&hellip;</cfif>
</cfif>

<cfloop list="#pageNumbers#" index="page">
	<cfif paginator.isCurrentPage(page)>
		<strong>#page#</strong>
	<cfelse>
		<a href="?page=#page#">#page#</a>
	</cfif>
</cfloop>	

<cfif not paginator.isLastPage()>
	<cfif listGetAt(pageNumbers, listLen(pageNumbers)) neq paginator.lastPage()>&hellip;</cfif>
	<strong><a href="?page=#paginator.nextPage()#">next &rsaquo;</a></strong>
</cfif>

</cfoutput>    

