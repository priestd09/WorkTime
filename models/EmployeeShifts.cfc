<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset belongsTo("employee")>
		<cfset belongsTo("shift")>
    </cffunction>
</cfcomponent>