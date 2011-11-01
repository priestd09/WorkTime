<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset hasMany("businessdays")>
		<cfset hasMany("employees")>
		<cfset hasMany("offrequests")>
		<cfset hasMany("weeks")>
		<cfset hasMany("skills")>
    </cffunction>
</cfcomponent>