<cfcomponent>

<!---  Get Roles    --->
    <cffunction  name="local.getUserRoles" access = "public" returntype = "query">
        <cfquery name = "getRole" datasource = "shoppingcart">
            SELECT 
                fldRole_ID,
                fldRoleName
            FROM 
                tblRoles
        </cfquery>
        <cfreturn local.getUserRoles >
    </cffunction>
</cfcomponent>