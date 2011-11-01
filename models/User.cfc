<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset hasOne("employee")>
		<cfset belongsTo("usertype")>
    </cffunction>
</cfcomponent>