<cfcomponent >
	<cffunction name="init">
		<cfargument name="recordCount"/>
		<cfset variables._recordCount = arguments.recordCount />
		<cfset variables._currentPage = 1 />
		<cfset variables.pageSize = 10 />
		<cfreturn this/>
	</cffunction>
	
	<cffunction name="setPageSize">
		<cfargument name="pageSize"/>
		<cfset variables.pageSize = arguments.pageSize />
	</cffunction>
	
	<cffunction name="recordCount">
		<cfreturn variables._recordCount/>
	</cffunction>
	
	<cffunction name="currentPage">
		<cfreturn variables._currentPage/>
	</cffunction>

	<cffunction name="setCurrentPage">
		<cfargument name="page">
		<cfset variables._currentPage = arguments.page />
	</cffunction>
	
	<cffunction name="isFirstPage">
		<cfreturn variables._currentPage eq 1/>
	</cffunction>
	
	<cffunction name="isLastPage">
		<cfreturn currentPage() eq lastPage()/>
	</cffunction>
	
	<cffunction name="lastPage">
		 <cfreturn (recordCount() - 1) \ variables.pageSize  + 1>
	</cffunction>
	
	<cffunction name="nextPage">
		<cfreturn currentPage() + 1/>
	</cffunction>
	
	<cffunction name="previousPage">
		<cfreturn currentPage() - 1/>
	</cffunction>
	
	<cffunction name="startRow">
		<cfreturn 1 +  variables.pageSize * (currentPage() - 1)/>
	</cffunction>
	
	<cffunction name="endRow">
		<cfreturn min(variables.pageSize * currentPage(), recordCount())/>
	</cffunction>

	<cffunction name="pageNumberList">
		<cfargument name="howManyPages"/>
		<cfset var buffer = "" />
		<cfset var i = 0 />
		<cfset var from = max(min(currentPage() - int(howManyPages / 2), lastPage() - howManyPages + 1), 1)/>
		<cfset var to = min(from + howManyPages - 1, lastPage()) />
		<cfloop index="i" from="#from#" to="#to#">
			<cfset buffer = listAppend(buffer, i) />
		</cfloop>
		<cfreturn buffer/>
	</cffunction>
	
	<cffunction name="isCurrentPage">
		<cfargument name="p"/>
		<cfreturn p eq currentPage() />
	</cffunction>

</cfcomponent>