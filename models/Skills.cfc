<cfcomponent extends="Model">
    <cffunction name="init">
       <cfset hasMany("employeeskills")>
       <cfset belongsTo("business")>
    </cffunction>
</cfcomponent>