<cfcomponent extends="Model" output="false">
    <cffunction name="init">
    	<cfset validatesPresenceOf("email, password")>
    	<cfset validatesUniquenessOf("email")>
		<cfset hasOne("employee")>
		<cfset belongsTo("usertype")>
    </cffunction>
</cfcomponent>