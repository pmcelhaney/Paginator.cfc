<cfcomponent >
	<cffunction name="init" output="false">
		<cfargument name="recordCount"/>
		<cfset variables._recordCount = arguments.recordCount />
		<cfset variables._currentPage = 1 />
		<cfset variables.pageSize = 12 />
		<cfreturn this/>
	</cffunction>
	
	<cffunction name="setPageSize" output="false">
		<cfargument name="pageSize"/>
		<cfset variables.pageSize = arguments.pageSize />
	</cffunction>
	
	<cffunction name="recordCount" output="false">
		<cfreturn variables._recordCount/>
	</cffunction>
	
	<cffunction name="currentPage" output="false">
		<cfreturn variables._currentPage/>
	</cffunction>

	<cffunction name="setCurrentPage" output="false">
		<cfargument name="page">
		<cfset variables._currentPage = arguments.page />
	</cffunction>
	
	<cffunction name="isFirstPage" output="false">
		<cfreturn variables._currentPage eq 1/>
	</cffunction>
	
	<cffunction name="isLastPage" output="false">
		<cfreturn currentPage() eq lastPage()/>
	</cffunction>
	
	<cffunction name="lastPage" output="false">
		 <cfreturn (recordCount() - 1) \ variables.pageSize  + 1>
	</cffunction>
	
	<cffunction name="nextPage" output="false">
		<cfreturn currentPage() + 1/>
	</cffunction>
	
	<cffunction name="previousPage" output="false">
		<cfreturn currentPage() - 1/>
	</cffunction>
	
	<cffunction name="startRow" output="false">
		<cfreturn 1 +  variables.pageSize * (currentPage() - 1)/>
	</cffunction>
	
	<cffunction name="endRow" output="false">
		<cfreturn min(variables.pageSize * currentPage(), recordCount())/>
	</cffunction>

	<cffunction name="pageNumberList" output="false">
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
	
	<cffunction name="isCurrentPage" output="false">
		<cfargument name="p"/>
		<cfreturn p eq currentPage() />
	</cffunction>

</cfcomponent>