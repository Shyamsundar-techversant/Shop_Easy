<cfcomponent>
    <cfset this.name = "ShoppinCart" >
    <cfset this.sessionManagement = "true" >
    <cfset this.sessionTimeOut = createTimespan(0, 0, 30, 0) >
    <cffunction  name = "onApplicationStart" returntype = "void">
        <cfset application.encryptionKey = generateSecretKey('AES') >
        <cfset application.userContObj = createObject("component","controller.user")>
        <cfset application.userModObj = createObject("component", "model.user") >
        <cfset application.categModObj  = createObject("component","model.category") >
    </cffunction>
    <cffunction  name = "onRequestStart" returntype = "void">
        <cfif structKeyExists(url,"reload") AND url.reload EQ 1>
            <cfset onApplicationStart()>
        </cfif>
        <cfset local.pages = ["signup.cfm","log.cfm"] >
        <cfset local.restrictedPages = [    "adminDashboard.cfm","adminCategory.cfm",
                                            "adminSubCategory.cfm","adminProduct.cfm"
                                        ]
        >
        <cfif NOT structKeyExists(session, "adminName") 
            AND NOT structKeyExists(session, "adminId")
            AND arrayFindNoCase(local.restrictedPages, listLast(CGI.SCRIPT_NAME,'/'))
        >
            <cflocation url = "../log.cfm" addToken = "false">
        </cfif>
    </cffunction>
</cfcomponent>