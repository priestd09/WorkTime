<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset belongsTo("week")>
		<cfset hasMany("shifts")>
    </cffunction>
</cfcomponent>