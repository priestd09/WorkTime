<cfcomponent extends="Controller">
	<cffunction name="init">
		<cfset test= model("employees")><!--- Should be all lowercase and plural--->
		<cfset testFind = test.findAll(include="Business")><!--- should be Camel Case and singular--->
	</cffunction>
	<cffunction name="index">
		<cfset setOverall()>
	</cffunction>
	<cffunction name="addOverall">
		<cfset test2=model("overallavalibilitydays")>
		<cfset testFind2= test2.findAll(include="Business")>
	</cffunction>
	<cffunction name="editOverall">
		<cfset test2=model("employees")>
		<cfset testFind2= test2.findAll(include="Business")>
	</cffunction>
		<cffunction name="getOverall">
		<cfset test2=model("employees")>
		<cfset testFind2= test2.findAll(include="Business")>
	</cffunction>
	<cffunction name="addRequest">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="editRequest">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="deleteRequest">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getRequestByEmployee">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
</cfcomponent>