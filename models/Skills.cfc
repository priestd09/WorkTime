<cfcomponent extends="Model">
    <cffunction name="init">
    	<cfset validatesPresenceOf(properties="businessid, name")>
    	<cfset validatesUniquenessOf(properties="name")>
		<cfset hasMany("employeeskills")>
		<cfset belongsTo("business")>
    </cffunction>
</cfcomponent>