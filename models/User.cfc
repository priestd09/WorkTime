<cfcomponent extends="Model" output="false">
    <cffunction name="init">
    	<cfset validatesPresenceOf("email, password")>
    	<cfset validatesUniquenessOf("email")>
    	<cfset validatesFormatOf(property="email",type="email")>
    	<cfset validatesLengthOf(property="password",maximum=255)>
 	
		<cfset hasOne("employee")>
		<cfset belongsTo("usertype")>
    </cffunction>
</cfcomponent>