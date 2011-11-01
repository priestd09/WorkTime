<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset hasMany("scheduledays")>
		<cfset belongsTo("business")>
    </cffunction>
</cfcomponent>