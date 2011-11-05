<cfcomponent extends="Controller">
	
	<cffunction name="index">
		<!----AT SOME POINT WE NEED TO MAKE SURE THAT YOU ARE ONLY GETTING A WEEK OR SO AT A TIME, SERIOUSLY QUERIES PEOPLE----->
		<cfset dayNames=["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]>
		
		<cfif IsDefined("session.user.businessid")>
			<cfset shifts=model("week").findAll(where="businessid=#session.user.businessid#",include="days(shifts))")>
			<cfset skillnames=model("skills").findAllByBusinessid(value="#session.user.businessid#")>
			<cfset weeks = getSchedule()>
			<cfset info = getEmployeesByShift()>
			<cfset getSkills()>
			<cfset id=0>
			<cfset getEmployeesBySkill()>
		<cfelse>
			<cfset redirectTo(controller="business", action="add")>
		</cfif>
		
		
		<cfset employeedropdown=model("skills").new()>
		
	</cffunction>
	
	<cffunction name="addEmployeeShift">
		<cfset employeeShift = model("employeeshift").new()>
		<cfset employeeShift.employeeid = params.employeeid>
		<cfset employeeShift.shiftid = params.shiftid>
		<cfset employeeShift.skillid = params.skillid>
<!--- 	<cfdump var="#employeeShift#"><cfabort> --->
		<cfset employeeShift.save()>
		<cfset index()>
		<cfset renderPage(action="index")>
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
			
			<cfset times=[800, 1200, 1600, 2000, 2400]>
			
			<cfloop from="1" to="7" index="i">
				<cfset days=model("days").new()>
				<cfset days.day = i>
				<!----CHANGE THIS WEEKS ID TO DYNAMIC--->
				<cfset days.weekid = 11>
				<cfset days.save()>
				
				<!----ONCE TIME IS FIXED CHANGE THE CALCULATION OF SHIFT TIME---->
				<cfloop from="1" to="4" index="z">
					<cfset shif=model("shifts").new()>
					<cfset shif.dayid = days.id>
					<cfset shif.starttime = times[z]>
					<cfset shif.endtime = times[z]>
					<cfset shif.save()>
				</cfloop>
				
			</cfloop>
			
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
	
	<cffunction name="updateList">
		<cfset index()>
		<cfset getEmployeesBySkill(params.employeedropdown.dropskill)>
		
		<cfset employeedropdown=model("skills").new(params.employeedropdown)>
		<cfset full={time="full"}>
		<cfset newEmployee=model("employees").new(full)>			
		<cfset submitType="add">
		<cfset getSkills()>
		
		<cfset renderPage(action="index")>
	</cffunction>
	
	
	<cffunction name="getEmployeesBySkill">
		<cfargument name="id" required="false">
		<cfset businessid = session.user.businessid>
		<cfset test= model("employees")>
<!--- 		<cfdump var="#id#"><cfabort> --->

		<cfset employees = test.findAllBySkillidAndBusinessid(value="#id#,#businessid#",include="EmployeeSkills(skill)")>
	</cffunction>
	
	<cffunction name="getSkills">
		<cfset skills = model("skills").findAllByBusinessid(value=session.user.businessid)>
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
		
<!--- 		<cfdump var="#shifts#"><cfabort> --->
		
		<cfloop query="shifts">
			<cfswitch expression="#shifts.day#">
				<cfcase value="1">				
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", id="#shifts.shiftid#"}>
					<cfset ArrayAppend(monday, #shift#)>
				</cfcase>
				<cfcase value="2">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", id="#shifts.shiftid#"}>
					<cfset ArrayAppend(tuesday, #shift#)>
				</cfcase>
				<cfcase value="3">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", id="#shifts.shiftid#"}>
					<cfset ArrayAppend(wednesday, #shift#)>
				</cfcase>
				<cfcase value="4">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", id="#shifts.shiftid#"}>
					<cfset ArrayAppend(thursday, #shift#)>
				</cfcase>
				<cfcase value="5">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", id="#shifts.shiftid#"}>
					<cfset ArrayAppend(friday, #shift#)>	
				</cfcase>
				<cfcase value="6">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", id="#shifts.shiftid#"}>
					<cfset ArrayAppend(saturday, #shift#)>
				</cfcase>
				<cfcase value="7">
					<cfset shift = {start = "#shifts.starttime#", end= "#shifts.endtime#", id="#shifts.shiftid#"}>
					<cfset ArrayAppend(sunday, #shift#)>
				</cfcase>
			</cfswitch>
		</cfloop>
		<cfset weekS.monday = monday>
		<cfset weekS.tuesday = tuesday>
	<!--- 	<cfdump var="#weekS.tuesday#"><cfabort> --->
		<cfset weekS.wednesday = wednesday>
		<cfset weekS.thursday = thursday>
		<cfset weekS.friday = friday>
		<cfset weekS.saturday = saturday>
		<cfset weekS.sunday = sunday>
		<cfreturn #weekS#>

	</cffunction>
	
	
	<cffunction name="getEmployeesByShift">
		<cfloop collection=#weeks# item="day">
			
			<cfloop array="#weeks[day]#" index="shift">
				
				
				<cfset employee=model("employeeshift").findAll(include="employee,shift,skill", where="shiftid=#shift.id#")>
					
					<cfset employees=ArrayNew(1)>
					
					<cfloop query="employee">
						<cfset emp=StructNew()>
						<cfset emp.name = employee.name>
						<cfset emp.skillname = employee.skillname>
						<cfset ArrayAppend(employees, #emp#)>
					</cfloop>
					
					<cfset skills = StructNew()>
					<!--- getting the skill names into an "struct" --->
					
					
					<cfloop query="skillnames">
						<cfset skills[#skillnames.name#]=StructNew()>
						<cfset skills[#skillnames.name#].name = #skillnames.name#>
						<cfset skills[#skillnames.name#].count = 0>
					</cfloop>
					
					<cfloop array="#employees#" index="emp">
						<cfset skills[#emp.skillname#].count += 1>
					</cfloop>
					
					<cfset shift.skills = skills>
					<cfset shift.employees = employees>
			</cfloop>
			
		</cfloop>
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