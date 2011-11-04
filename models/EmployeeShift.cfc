<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset belongsTo(name="employee", joinType="outer")>
		<cfset belongsTo("shift")>
		<cfset belongsTo(name="skill", joinType="outer")>
    </cffunction>
</cfcomponent>