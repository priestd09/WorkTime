<cfcomponent extends="Model">
    <cffunction name="init">
       <cfset belongsTo("employee")>
       <cfset belongsTo("skill")>
    </cffunction>
</cfcomponent>