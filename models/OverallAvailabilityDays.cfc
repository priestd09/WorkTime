<cfcomponent extends="Model">
    <cffunction name="init">
       <cfset belongsTo("employee")>
    </cffunction>
</cfcomponent>