<cfcomponent extends="Controller">
	
	<cffunction name="index">
		<cfset employeeid=13>
		<cfset getOverall(employeeid)>
		<cfset getRequestByEmployee(employeeid)>
		<cfset hours=["All Day","8:00pm","9:00pm"]>
<!--- 	<cfset dayNames=("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")> --->
		<cfset overallDay=model("overallavalibilitydays")>
		<cfset offrequest=model("offrequests").new()>
		<cfset shifts=model("week").findAll(where="businessid=5 AND employeeid=13",include="days(shifts(employeeshifts(skill)))")>
		<cfset weeks = getSchedule()>
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
	
	<cffunction access="private" name="getSchedule">
		<cfset weekS = StructNew()>
		<cfset monday = ArrayNew(1)>
		<cfset tuesday = ArrayNew(1)>
		<cfset wednesday = ArrayNew(1)>
		<cfset thursday = ArrayNew(1)>
		<cfset friday = ArrayNew(1)>
		<cfset saturday = ArrayNew(1)>
		<cfset sunday = ArrayNew(1)>
		
		<cfloop query="shifts">
			<cfswitch expression="#shifts.day#">
				<cfcase value="1">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset ArrayAppend(monday, #shift#)>
				</cfcase>
				<cfcase value="2">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset ArrayAppend(tuesday, #shift#)>
				</cfcase>
				<cfcase value="3">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset ArrayAppend(wednesday, #shift#)>
				</cfcase>
				<cfcase value="4">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset ArrayAppend(thursday, #shift#)>
				</cfcase>
				<cfcase value="5">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset ArrayAppend(friday, #shift#)>	
				</cfcase>
				<cfcase value="6">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset ArrayAppend(saturday, #shift#)>
				</cfcase>
				<cfcase value="7">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset ArrayAppend(sunday, #shift#)>
				</cfcase>
			</cfswitch>
		</cfloop>
		
		<cfset weekS.monday = monday>
		<cfset weekS.tuesday = tuesday>
		<cfset weekS.wednesday = wednesday>
		<cfset weekS.thursday = thursday>
		<cfset weekS.friday = friday>
		<cfset weekS.saturday = saturday>
		<cfset weekS.sunday = sunday>
		
		<cfreturn #weekS#>
	</cffunction>
	
</cfcomponent>