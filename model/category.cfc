<cfcomponent>

    <!---  ADD CATEGORY    --->
    <cffunction  name="categoryAdd" access = "public" returntype = "any">
        <cfargument name = "categName" type = "string" required = "true" >
        <cfset local.result = "">
        <cftry>          
            <cfquery datasource = "shoppingcart" result ="local.addCategory">
                INSERT INTO 
                        tblCategory(
                            fldCategoryName,
                            fldActive,
                            fldCreatedById,
                            fldUpdatedById,
                            fldUpdatedDate
                        )
                VALUES(
                        <cfqueryparam value = "#arguments.categName#" cfsqltype = "cf_sql_varchar">,
                        <cfqueryparam value = "1" cfsqltype = "cf_sql_integer">,
                        <cfqueryparam value = "#session.adminId#" cfsqltype = "cf_sql_integer">,
                        <cfqueryparam value = "#session.adminId#" cfsqltype = "cf_sql_integer">,
                        <cfqueryparam value = "#now()#" cfsqltype = "cf_sql_date">
                )

            </cfquery>
            <cfif local.addCategory.recordCount EQ 1>
                <cfset local.result = "Success">
                <cfreturn local.result>
            <cfelse>
                <cfset local.errorResult = ["Invalid categoryname"] >
                <cfreturn local.errorResult>
            </cfif>
        <cfcatch type="exception">
            <cfdump var = "#cfcatch#">
        </cfcatch>
        </cftry>
    </cffunction>

    <!---  GET ALL CATEGORY    --->
    <cffunction name = "getAllCategory" access = "public" returntype = "struct">
        <cfargument  name="categoryId" type = "integer" required = "false">

        <cftry>
            <cfquery name = "getCategory" datasource = "shoppingcart">
                SELECT 
                    fldCategory_ID,
                    fldCategoryName
                FROM 
                    tblCategory
            </cfquery>
        <cfcatch type="exception">
        </cfcatch>
        </cftry>
    </cffunction>
</cfcomponent>