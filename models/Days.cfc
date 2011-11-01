<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset belongsTo("scheduleweek")>
		<cfset hasMany("shifts")>
    </cffunction>
</cfcomponent>