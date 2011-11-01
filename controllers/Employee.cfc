<cfcomponent extends="Controller">
	<cffunction name="init">
		<cfset test= model("employees")><!--- Should be all lowercase and plural--->
		<cfset testFind = test.findAll(include="Business")><!--- should be Camel Case and singular--->
	</cffunction>
	<cffunction name="setOverall">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
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