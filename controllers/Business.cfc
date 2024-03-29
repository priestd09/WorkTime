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
		<cfelse>
			<cfset redirectTo(controller="business", action="add")>
		</cfif>
			<cfset business = model("business").findByKey(session.user.businessid)>
			<cfset businessDays = model("businessdays").findOneByBusinessid(session.user.businessid)>

			<cfif IsDefined("params.key")>
				<cfset skillid=params.key>
				<cfset updateList(skillid)>

				<cfelseif skills.recordcount gt 0 >
					<cfset skillid=#skills.getrow(0).getcolumn(0)#>
					<cfset updateList(skillid)>
				<cfelse>
					<cfset employeedropdown=model("skills").new()>
					<cfset employees=QueryNew("")>
			</cfif>
	</cffunction>
	
	<cffunction name="addEmployeeShift">
		<cfset employeeShift = model("employeeshift").new()>
		<cfset employeeShift.employeeid = params.employeeid>
		<cfset employeeShift.shiftid = params.shiftid>
		<cfset employeeShift.skillid = params.skillid>
		<cfset employeeShift.save()>
		<cfset index()>
		<cfset renderPage(action="index")>
	</cffunction>
	
	
	<cffunction name="add">
		<cfset business=model("business").new()>
		<cfset businessdays=model("businessdays").new()>
		<!------ POPULATE SELECTS WITH MORE VALUES---->
		
		
		<cfset hours=["7:00am","8:00pm","9:00pm"]>
		<cfset hoursValue=[7,20,21]>
		
		<cfset hoursOption = queryNew("starttime,endtime, number","VarChar,VarChar, Integer")>
		<cfloop index="i" from="1" to="3">
		<cfset queryAddRow(hoursOption)>
		<cfset querySetCell(hoursOption, "starttime", hours[i])>
		<cfset querySetCell(hoursOption, "endtime", hours[i])>
		<cfset querySetCell(hoursOption, "number", hoursValue[i])>
		</cfloop>		
		<cfset timeHours=["40 hours","35 hours"]>
		<cfset shiftHours=["4 hours","8 hours"]>
		
		<cfset shiftHoursValue=[4,8]>
		<cfset shiftHoursOption = queryNew("shiftlength, number","VarChar, Integer")>
		<cfloop index="i" from="1" to="2">
		<cfset queryAddRow(shiftHoursOption)>
		<cfset querySetCell(shiftHoursOption, "shiftlength", shiftHours[i])>
		<cfset querySetCell(shiftHoursOption, "number", shiftHoursValue[i])>
		</cfloop>	
		
	</cffunction>
	<cffunction name="create">
		<cfset business= model("business").new(params.business)>
		<cfset business.save()>
		<cfif business.hasErrors()>
			<cfset add()>
			<cfset businessdays=model("businessdays").new(params.businessdays)>
			<cfset renderPage(action="add")>
		<cfelse>
			<cfset businessdays=model("businessdays").new(params.businessdays)>
			<cfset businessdays.businessid=business.id>
			<cfset businessdays.save()>
			<cfset session.user.businessid=business.id>
			<cfset user=model("user").findByKey(session.user.id)>
			<cfset user.businessid=business.id>
			<cfset user.save()>			
			
			<cfset week=model("weeks").new()>
			<cfset week.businessid = session.user.businessid>
			<cfset week.save()>	
			
			<cfloop from="1" to="7" index="i">
				<cfset day=model("days").new()>
				<cfset day.weekid = week.id>
				<cfset day.day = i>
				<cfset day.save()>
				<cfset shiftL = business.shiftlength>
				<cfset start = businessDays.starttime>
				<cfset end = businessDays.endtime>
				<cfloop condition="start lt end">
					<cfset shift=model("shifts").new()>
					<cfset shift.starttime = start>
					<cfset start += shiftL>
					<cfif start gt end>
						<cfset start = end>
					</cfif>
					<cfset shift.endtime = start>
					<cfset shift.dayid = day.id>
					<cfset shift.save()>
				</cfloop>
			</cfloop>
			
			
			
			
			<cfset redirectTo(controller="business", action="index")>
		</cfif>
	</cffunction>
	<cffunction name="edit">
		<cfset add()>
		<cfset business = model("business").findByKey(session.user.businessid)>
		<cfset captchaError=false>
	</cffunction>
	<cffunction name="update">
		<cfif validateCaptcha()>
			<cfset business= model("business").new(params.business)>
			<cfset business.updateByKey(session.user.businessid, business)>	
			<cfset captchaError=false>
			<cfset businessdays=model("businessdays").new(params.businessdays)>
			<cfset businessdays.businessid=session.user.businessid>
			<cfset businessdays.save()>
			<cfset redirectTo(controller="business", action="index")>
		<cfelse>
			<cfset edit()>
			<cfset captchaError=true>
			<cfset renderPage(action="edit")> 
		</cfif>
	</cffunction>
	
	<cffunction name="updateList">
		<cfargument name="skillid" required="false">
		<cfset empstruc=StructNew()>
		<cfset empstruc.dropskill=skillid>
		<cfset getEmployeesBySkill(skillid)>
		<cfset employeedropdown=model("skills").findByKey(skillid)>
		<cfset full={time="full"}>
		<cfset newEmployee=model("employees").new(full)>			
		<cfset submitType="add">
		<cfset getSkills()>
	</cffunction>
	<cffunction name="redirectToKey">
		<cfset redirectTo(controller="business",action="index",key=params.employeedropdown.id)>
	</cffunction>
	
	
	<cffunction name="getEmployeesBySkill">
		<cfset businessid = session.user.businessid>
		<cfset test= model("employees")>
		<cfset employees = test.findAllBySkillidAndBusinessid(value="#skillid#,#businessid#",include="EmployeeSkills(skill)")>
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