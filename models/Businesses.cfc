<cfcomponent extends="Model">
    <cffunction name="init">
    	<cfset validatesPresenceOf("name")>
    	<cfset validatesLengthOf(property="name",maximum=255)>
		<cfset hasMany("businessdays")>
		<cfset hasMany("employees")>
		<cfset hasMany("offrequests")>
		<cfset hasMany("weeks")>
		<cfset hasMany("skills")>
		<cfset hasMany("users")>
    </cffunction>
</cfcomponent>