<cfcomponent extends="Controller">
	<cffunction name="init">
		<cfset test= model("employees")><!--- Should be all lowercase and plural--->
		<cfset testFind = test.findAll(include="Business")><!--- should be Camel Case and singular--->
	</cffunction>
	<cffunction name="index">
		<cfset employeeid=10>
		<cfset getOverall(employeeid)>
		<cfset getRequestByEmployee(employeeid)>
	</cffunction>
	<cffunction name="addOverall">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="editOverall">
		<cfset test2=model("employees")>
		<cfset testFind2= test2.findAll(include="Business")>
	</cffunction>
	<cffunction name="getOverall" hint="returns all the days that the employee has set for their overall availibility">
		<cfargument name="id" type="numeric" hint="the employee id">
		<cfset days=model("overallavalibilitydays").findAllByEmployeeid(value=id)>
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
	<cffunction name="getRequestByEmployee" hint="returns the requests made by the that employee">
		<cfargument name="id" type="numeric" hint="the employee id">
		<cfset requests = model("offrequests").findAllByEmployeeid(value=id)>
	</cffunction>
</cfcomponent>