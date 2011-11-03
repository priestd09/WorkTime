<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset belongsTo("employee")>
		<cfset belongsTo("shift")>
		<cfset belongsTo("skill")>
    </cffunction>
</cfcomponent>