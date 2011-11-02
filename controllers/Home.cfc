<cfcomponent extends="Controller">
	<cffunction name="init">
		<cfset test= model("employees")><!--- Should be all lowercase and plural--->
		<cfset testFind = test.findAll(include="Business")><!--- should be Camel Case and singular--->
	</cffunction>
	<cffunction name="index">
		<cfset user= model("user")>
		<cfset newUser=model("user")>
	</cffunction>
	<cffunction name="signin">

<!--- 		<cfset testFind = test.findAll(include="Business")> --->
	</cffunction>
	<cffunction name="signup">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
</cfcomponent>