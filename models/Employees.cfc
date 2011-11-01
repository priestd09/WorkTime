<cfcomponent extends="Model">
    <cffunction name="init">
    	<cfset validatesUniquenessOf(properties="email")>
    
		<cfset belongsTo("business")>
		<cfset belongsTo("user")>
		<cfset hasMany("employeeshifts")>
		<cfset hasMany("employeeskills")>
		<cfset hasMany("offrequests")>
		<cfset hasMany("overallavailabilitydays")>
    </cffunction>
</cfcomponent>