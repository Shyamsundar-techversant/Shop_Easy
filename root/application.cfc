<cfcomponent>
    <cfset this.name = "ShoppinCart" >
    <cfset this.sessionManagment = "true" >
    <cfset this.sessionTimeOut = createTimespan(0, 0, 30, 0) >
    <cffunction  name = "onApplicationStart" returntype = "void">
        <cfset application.encryptionKey = generateSecretKey('AES') >
    </cffunction>
    <cffunction  name="onRequestStart">
    </cffunction>
</cfcomponent>