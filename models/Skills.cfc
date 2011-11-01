<cfcomponent extends="Model">
    <cffunction name="init">
       <cfset hasMany("employees")>
       <cfset belongsTo("business")>
    </cffunction>
</cfcomponent>