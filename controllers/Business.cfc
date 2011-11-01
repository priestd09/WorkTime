<cfcomponent extends="Controller">
	<cffunction name="init">
		<cfset test= model("employees")><!--- Should be all lowercase and plural--->
		<cfset testFind = test.findAll(include="Business")><!--- should be Camel Case and singular--->
	</cffunction>
	<cffunction name="add">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="edit">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getWeek">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getDay">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="addWeek">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="addDay">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="addEmployeeShift">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="deleteEmployeeShift">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="editPublished">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getRequestCount">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getEmployees">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getEmployeeSkills">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
</cfcomponent>