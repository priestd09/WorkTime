<cfcomponent extends="Model">
    <cffunction name="init">
       <cfset validatesUniquenessOf(properties="weekday,employeeid")>
       <cfset belongsTo("employee")>
    </cffunction>
</cfcomponent>