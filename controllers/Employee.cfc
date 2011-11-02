<cfcomponent extends="Controller">
	<cffunction name="init">
		<!---<cfset test= model("employees")> Should be all lowercase and plural--->
		<!---<cfset testFind = test.findAll(include="Business")> should be Camel Case and singular--->
	</cffunction>
	
	<cffunction name="index">
		<cfset employeeid=10>
		<cfset getOverall(employeeid)>
		<cfset getRequestByEmployee(employeeid)>
		<cfset hours=["All Day","8:00pm","9:00pm"]>
		<cfset overallDay=model("overallavalibilitydays")>
		<cfset offrequest=model("offrequests").new()>
		
<!--- 		IF YOU ARE REFRESHING THE SAME PAGE --->

		<cfif !IsDefined("overallDay1")>
			<cfset overallDay1=model("overallavalibilitydays").new()>
		</cfif>
		<cfif !IsDefined("offrequest1")>
			<cfset offrequest1=model("offrequests").new()>
		</cfif>

	</cffunction>
	
	<cffunction name="addOverall">
		<cfset weekday=7>
		<cfset overallDay1=model("overallavalibilitydays").new(params.overallDay)>
		<cfset overallDay1.weekday=weekday>
		<cfset overallDay1.save()>
		<cfset index()>
		<cfset renderPage(action="index")>
	</cffunction>
	
	<cffunction name="getOverall" hint="returns all the days that the employee has set for their overall availibility">
		<cfargument name="id" type="numeric" hint="the employee id">
		<cfset days=model("overallavalibilitydays").findAllByEmployeeid(value=id)>
	</cffunction>
	
	<cffunction name="getOverallByDay" hint="returns that day">
		<cfargument name="paramid" type="numeric" hint="the employee id">
		<cfargument name="paramday" type="numeric" hint="the employee id">
		<cfset getDay=model("overallavalibilitydays").findAllByEmployeeidAndWeekday(value="#paramid#,#paramday#")>
	</cffunction>
	
	<cffunction name="addRequest">
		<cfset employeeid=10>
		<cfset businessid=1>
		<cfset pending="pending">
		<cfset offrequest1=model("offrequests").new(params.offrequest)>
		<cfset offrequest1.employeeid=employeeid>
		<cfset offrequest1.businessid=businessid>
		<cfset offrequest1.pending=pending>
		<cfset offrequest1.save()>
		<cfset index()>
		<cfset renderPage(action="index")>
	</cffunction>
	
	<cffunction name="deleteRequest">

	</cffunction>
	
	<cffunction name="getRequestByEmployee" hint="returns the requests made by the that employee">
		<cfargument name="id" type="numeric" hint="the employee id">
		<cfset requests = model("offrequests").findAllByEmployeeid(value=id)>
	</cffunction>
	
	<cffunction name="getEmployeeSchedule" hint="returns the info about the schedule">
	
	
	</cffunction>
</cfcomponent>