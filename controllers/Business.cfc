<cfcomponent extends="Controller">
	
	<cffunction name="index">
		<!----AT SOME POINT WE NEED TO MAKE SURE THAT YOU ARE ONLY GETTING A WEEK OR SO AT A TIME, SERIOUSLY QUERIES PEOPLE----->
<!--- 	<cfset dayNames=("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")> --->
		<cfset shifts=model("week").findAll(where="businessid=5",include="days(shifts(employeeshifts(skill,employee)))")>
		<cfset weeks = getSchedule()>
<!--- 		<cfdump var="#shifts#"><cfabort> --->
		
		
	</cffunction>
	
	<cffunction name="add">
		<cfset business=model("business").new()>
		<cfset businessdays=model("businessdays").new()>
		<cfset hours=["8:00pm","9:00pm"]>
		<cfset timeHours=["40 hours","35 hours"]>
		<cfset shiftHours=["4 hours","8 hours"]>
	</cffunction>
	<cffunction name="create">
		<cfset business= model("business").new(params.business)>
		<cfset business.save()>
		<cfif business.hasErrors()>
			<cfset businessdays=model("businessdays").new(params.businessdays)>
			<cfset hours=["8:00pm","9:00pm"]>
			<cfset timeHours=["40 hours","35 hours"]>
			<cfset shiftHours=["4 hours","8 hours"]>
			<cfset renderPage(action="add")>
		<cfelse>
			<cfset businessdays=model("businessdays").new(params.businessdays)>
			<cfset businessdays.businessid=business.id>
			<cfset businessdays.save()>
			<cfset session.user.businessid=business.id>
			<cfset user=model("user").findByKey(session.user.id)>
			<cfset user.businessid=business.id>
			<cfset user.save()>
			<cfset flashInsert(success="You've successfully set up your business")>
			<cfset redirectTo(controller="business", action="index")>
		</cfif>
	</cffunction>
	<cffunction name="edit">
		<cfset business = model("business").findByKey(session.user.businessid)>
		<cfset hours=["8:00pm","9:00pm"]>
		<cfset timeHours=["40 hours","35 hours"]>
		<cfset shiftHours=["4 hours","8 hours"]>
		<cfset captchaError=false>
		<cfset businessdays=model("businessdays").new()>
	</cffunction>
	<cffunction name="update">
		<cfif validateCaptcha()>
			
			<cfset business= model("business").new(params.business)>
			<cfset business.updateByKey(session.user.businessid, business)>	
			
			<cfset business = model("business").new(params.business)>
			<cfset hours=["8:00pm","9:00pm"]>
			<cfset timeHours=["40 hours","35 hours"]>
			<cfset shiftHours=["4 hours","8 hours"]>
			<cfset businessdays=model("businessdays").new()>
			<cfset captchaError=false>
			<cfif business.hasError()>
				<cfset edit()>
				<cfset renderPage(action="edit")> 

			<cfelse>
				<cfset redirectTo(controller="business", action="index")>
			</cfif>
			
		<cfelse>
			<cfset edit()>
			<cfset captchaError=true>
			<cfset renderPage(action="edit")> 
		</cfif>
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
					<cfset employees=[]>
					<cfset skills=[]>
					<cfset ArrayAppend(employees, #shifts.employeename#)>
					<cfset ArrayAppend(skills, #shifts.name#)>
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset shift.employees = employees>
					<cfset shift.skills = skills>
					<cfset ArrayAppend(monday, #shift#)>
				</cfcase>
				<cfcase value="2">
					<cfset employees=[]>
					<cfset skills=[]>
					<cfset ArrayAppend(employees, #shifts.employeename#)>
					<cfset ArrayAppend(skills, #shifts.name#)>
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset shift.employees = employees>
					<cfset shift.skills = skills>
					<cfset ArrayAppend(tuesday, #shift#)>
				</cfcase>
				<cfcase value="3">
					<cfset employees=[]>
					<cfset skills=[]>
					<cfset ArrayAppend(employees, #shifts.employeename#)>
					<cfset ArrayAppend(skills, #shifts.name#)>
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset shift.employees = employees>
					<cfset shift.skills = skills>
					<cfset ArrayAppend(wednesday, #shift#)>
				</cfcase>
				<cfcase value="4">
					<cfset employees=[]>
					<cfset skills=[]>
					<cfset ArrayAppend(employees, #shifts.employeename#)>
					<cfset ArrayAppend(skills, #shifts.name#)>
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset shift.employees = employees>
					<cfset shift.skills = skills>
					<cfset ArrayAppend(thursday, #shift#)>
				</cfcase>
				<cfcase value="5">
					<cfset employees=[]>
					<cfset skills=[]>
					<cfset ArrayAppend(employees, #shifts.employeename#)>
					<cfset ArrayAppend(skills, #shifts.name#)>
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset shift.employees = employees>
					<cfset shift.skills = skills>
					<cfset ArrayAppend(friday, #shift#)>	
				</cfcase>
				<cfcase value="6">
					<cfset employees=[]>
					<cfset skills=[]>
					<cfset ArrayAppend(employees, #shifts.employeename#)>
					<cfset ArrayAppend(skills, #shifts.name#)>
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset shift.employees = employees>
					<cfset shift.skills = skills>
					<cfset ArrayAppend(saturday, #shift#)>
				</cfcase>
				<cfcase value="7">
					<cfset employees=[]>
					<cfset skills=[]>
					<cfset ArrayAppend(employees, #shifts.employeename#)>
					<cfset ArrayAppend(skills, #shifts.name#)>
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", name="#shifts.name#"}>
					<cfset shift.employees = employees>
					<cfset shift.skills = skills>
					<cfset ArrayAppend(sunday, #shift#)>
				</cfcase>
			</cfswitch>
		</cfloop>
		<cfset weekS.monday = monday>
<!--- 		<cfdump var="#weekS.monday#"><cfabort> --->
		<cfset weekS.tuesday = tuesday>
		<cfset weekS.wednesday = wednesday>
		<cfset weekS.thursday = thursday>
		<cfset weekS.friday = friday>
		<cfset weekS.saturday = saturday>
		<cfset weekS.sunday = sunday>
		<cfreturn #weekS#>
	</cffunction>

	<cffunction name="getrequests">
		<cfset requests=model("offrequests").findAllByPendingAndBusinessid(value="pending,#session.user.businessid#",include="employee")>
		
	</cffunction>
	<cffunction name="approve">

		<cfset req = model("offrequests").findByKey(params.key)>
		<cfset req.update(pending="approved")>	
		<cfset getrequests()>
		<cfset redirectTo(controller="business",action="getrequests")>
	</cffunction>
	<cffunction name="deny">
		<cfset req = model("offrequests").findByKey(params.key)>
		<cfset req.update(pending="denied")>
		<cfset getrequests()>
		<cfset redirectTo(controller="business",action="getrequests")>

	</cffunction>
</cfcomponent>