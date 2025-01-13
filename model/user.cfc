<cfcomponent>

    <!---  Hash Password  --->
    <cffunction name = "hashPassword" access = "private" returntype = "string">
        <cfargument name = "password" type = "string" required = "true" >
        <cfargument name = "saltString" type = "string" required = "true">
        <cfset local.saltedPass = arguments.password & arguments.saltString>
        <cfset local.hashedPassword = hash(local.saltedPass,"SHA-256","UTF-8")>
        <cfreturn local.hashedPassword>
    </cffunction>

    <!---  Log User    --->
    <cffunction name = "logUser" access = "public" returntype = "any" >
        <cfargument name = "userName" type = "string" required = "true">
        <cfargument name = "password" type = "string" required = "true">
        
        <cftry>
            <cfquery name = "local.userLog" datasource = "shoppingcart">
                SELECT 
                    fldUser_ID,
                    fldEmail,
                    fldPhone,
                    fldUserSaltString,
                    fldHashedPassword,
                    fldRoleId
                FROM
                    tblUser
                WHERE
                    fldEmail = <cfqueryparam value = "#arguments.userName#" cfsqltype = "cf_sql_varchar">
                OR 
                    fldPhone = <cfqueryparam value = "#arguments.userName#" cfsqltype = "cf_sql_varchar">
                    
            </cfquery>
            
            <cfif local.userLog.recordCount EQ 1>
                <cfset local.salt = local.userLog.fldUserSaltString>
                <cfset local.hashPass = hashPassword(arguments.password,local.salt)>
                <cfif local.hashPass EQ local.userLog.fldHashedPassword>
                    <cfset local.result = "LogIn Successful" >
                    <cfset session['adminId'] = local.userLog.fldUser_ID >
                    <cfset session['roleId'] = local.userLog.fldRoleId>                
                    <cflocation  url="./admin/adminDashBoard.cfm" addtoken = "false">
                <cfelse>
                    <cfset local.result = "Invalid Data" >
                </cfif>     
            <cfelse>
                <cfset local.result = "Incorrect username or password">        
            </cfif>          
        <cfcatch type="exception">
            <cfdump var = "#cfcatch#">
        </cfcatch>
        </cftry>

    </cffunction>



</cfcomponent>