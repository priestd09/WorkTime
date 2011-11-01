<cfcomponent extends="Model">
    <cffunction name="init">
       <cfset belongsTo("business")>
       <cfset belongsTo("employee")>
    </cffunction>
</cfcomponent>