<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset hasMany("days")>
		<cfset belongsTo("business")>
    </cffunction>
</cfcomponent>