<cfcomponent>

    <cffunction  name="validateCategName" access = "remote" returntype = "any" returnformat = "json">
        <cfargument name = "categName" type = "string" required = "true">
            <cfset local.errors = [] >
            <cfif structKeyExists(arguments, "categName")>
                <cfif len(trim(arguments.categName)) EQ 0>
		            <cfset arrayAppend(local.errors,"*Enter the category name")>
		        </cfif>
            </cfif>
            <cfif arrayLen(local.errors) GT 0 >
                <cfreturn local.errors >
            <cfelse>
                <cfset local.categAddResult = application.categModObj.categoryAdd(
                                                    argumentCollection = arguments   
                                                )
                >
                <cfif local.categAddResult EQ "Success">
                    <cfset local.result = "Success">
                    <cfreturn local.result>
                <cfelse>
                    <cfset arrayAppend(local.errors,"Invalid category name") >
                    <cfreturn local.errors >
                </cfif>
            </cfif>
    </cffunction>

    <!---  GET CATEGORY  --->

</cfcomponent>