<cfcomponent extends="Model">
    <cffunction name="init">
       <cfset belongsTo("business")>
       <cfset hasMany("employeeskills")>
    </cffunction>
</cfcomponent>