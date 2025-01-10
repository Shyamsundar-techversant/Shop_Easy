<cfcomponent>
    <cfset this.name = "ShoppinCart" >
    <cfset this.sessionManagement = "true" >
    <cfset this.sessionTimeOut = createTimespan(0, 0, 30, 0) >
    <cffunction  name = "onApplicationStart" returntype = "void">
        <cfset application.encryptionKey = generateSecretKey('AES') >
        <cfset application.userContObj = createObject("component","controller.user")>
        <cfset application.userModObj = createObject("component", "model.user") >
    </cffunction>
    <cffunction  name="onRequestStart">
        <cfif structKeyExists(url,"reload") AND url.reload EQ 1>
            <cfset onApplicationStart()>
        </cfif>
    </cffunction>
</cfcomponent>