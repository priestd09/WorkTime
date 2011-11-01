<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset hasMany("employeeshifts")>
		<cfset belongsTo("day")>
    </cffunction>
</cfcomponent>