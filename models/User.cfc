<cfcomponent extends="Model" output="false">
    <cffunction name="init">
    	<cfset validatesPresenceOf("email, password")>
    	<cfset validatesUniquenessOf("email")>
    	<cfset validatesFormatOf(property="email",type="email")>
		<cfset hasOne("employee")>
		<cfset belongsTo("usertype")>
    </cffunction>
</cfcomponent>