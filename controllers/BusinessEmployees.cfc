<cfcomponent extends="Controller">
	<cffunction name="index">
		<cfset full={time="full"}>
		<cfset newEmployee=model("employees").new(full)>		
		<cfset submitType="add">
		<cfset getSkills()>
		<cfif skills.recordcount gt 0>
			<cfset getEmployeesBySkill(#skills.getrow(0).getcolumn(0)#)>
			<cfelse>
				<cfset employees=QueryNew("")>
		</cfif>
		<cfset employeedropdown=model("skills").new()>
	</cffunction>
	
	<cffunction name="add">
		<cfset newEmployee=model("employees").new(params.newEmployee)>
		<cfset newEmployee.businessid = session.user.businessid>
		<cfset StructDelete(newEmployee,"id")>
		<cfset newEmployee.save()>
		
		<cftry>
			<cfset sendEmail(from="jlvanderslice@gmail.com",to=params.newEmployee.email,template="emailtemplate",subject="Thank You for Becoming a Member")>
			<cfcatch>
			
			</cfcatch>
		</cftry>
			
				
		<cfif newEmployee.hasErrors()>
			<cfset index()>
			<cfset renderpage(action="index")>
		<cfelse>
			<cfset business=model("businessdays").findAllByBusinessid(value=session.user.businessid)>
			<cfloop query="business">
				<cfif business.day eq "all">
					<cfset start=business.starttime>
					<cfset end=business.endtime>
					<cfloop from="1" to="7" index="i">
						<cfset struct=StructNew()>
						<cfset struct.weekday=i>
						<cfset struct.start=start>
						<cfset struct.end=end>
						<cfset struct.employeeid=newEmployee.id>
						<cfset days=model("overallavalibilitydays").new(struct)>
						<cfset days.save()>
					</cfloop>
				</cfif>
			</cfloop>
			<cfif IsDefined("params.checkedSkills")>
			<cfset checkedSkills2=params.checkedSkills>		
				<cfloop collection=#checkedSkills2# item="skill">
					<cfset newSkill=model("employeeskill").new()>
					<cfset newSkill.employeesid=newEmployee.id>
					<cfset newSkill.skillid=skill>
					<cfset newSkill.save()>
				</cfloop>
				<cfelse>
					<cfset flashInsert(error="You must select a skill for the employee")>
			</cfif>		
			<cfset index()>
			<cfset renderPage(action="index")>
		</cfif>
		
		
	</cffunction>

	<cffunction name="edit">
		<cfset index()>
		<cfset newEmployee=model("employees").findByKey(params.key)>
		<cfset getSkillsByEmployee()>
		<cfset submitType="update">
		<cfset renderPage(action="index")>
	</cffunction>
	
	
	<cffunction name="update">
	
		<cfset id=params.newEmployee.id>
		<cfset newEmployee = model("employees").new(params.newEmployee)>
		<cfset newEmployee.businessid = 1>
		<cfset newEmployee.updateByKey(id, params.newEmployee)>		
		
		
		<cfset checkedSkills2=params.checkedSkills>
		
		
		<cfset delete=model("employeeskills").findAllByEmployeesid(id)>
		<cfloop query="delete">
			<cfset deleteThis=model("employeeskills").findOneByEmployeesidAndSkillid(value="#delete.employeesid#,#delete.skillid#")>
			<cfset deleteThis.delete()>
		</cfloop>
		
		
		<cfloop collection=#checkedSkills2# item="skill">
			<cfset newSkill=model("employeeskill").new()>
			<cfset newSkill.employeesid=id>
			<cfset newSkill.skillid=skill>
			<cfset newSkill.save()>
		</cfloop>
		
		<cfif newEmployee.hasErrors()>
			<cfset index()>
			<cfset submitType="update">
			<cfset renderPage(action="index")>
			<cfelse>
				<cfset redirectTo(controller="businessemployees",action="index")>	
		</cfif>	
	</cffunction>
	
	<cffunction name="delete">
		<cfset id = params.newEmployee.id>
		<cfset newEmployee = model("employees").findOneById(id)>
		<cfset newEmployee.delete()>
		<cfset renderPage(action="index")>
	</cffunction>
	
	<cffunction name="getEmployees">
		<cfset employees= model("employees").findAllByBusinessid(value=session.user.businessid, include="Business")>
	</cffunction>
	
	<cffunction name="getEmployeesBySkill">
		<cfargument name="id" required="false">
		<cfset businessid = session.user.businessid>
		<cfset test= model("employees")>
		<cfset employees = test.findAllBySkillidAndBusinessid(value="#id#,#businessid#",include="EmployeeSkills(skill)")>
	</cffunction>
	
	<cffunction name="getSkills">
		<cfset skills = model("skills").findAllByBusinessid(value=session.user.businessid)>
		<cfset checked=ArrayNew(1)>
		<cfloop query="skills">
			<cfset add=false>
			<cfif IsDefined("skills.id") && IsDefined("checkedSkills")>
				<cfloop array=#checkedSkills# index="skill">
					<cfif skills.id eq skill>
						<cfset add=true>
						<cfset ArrayAppend(checked, true)>
					</cfif>
				</cfloop>
			</cfif>
			<cfif add eq false>
				<cfset ArrayAppend(checked, false)>
			</cfif>
		</cfloop>
		<cfset QueryAddColumn(skills, "checked", checked)>
	</cffunction>
	<cffunction name="getSkillsByEmployee">
		<cfset employeeSkill=model("employeeskills").findAllByEmployeesid(value=params.key)>
		<cfset checkedSkills=ArrayNew(1)>
		<cfloop query="employeeSkill">
			<cfset ArrayAppend(checkedSkills,#employeeSkill.skillid#)>
		</cfloop>
	</cffunction>
	<cffunction name="addSkills">
		<cfset newSkill = model("skills").new()>
		<cfset newSkill=model("skills").new(params.newSkill)>
		<cfset newSkill.businessid = 1>
		<cfset newSkill.save()>
		<cfset renderPage(action="index")>
	</cffunction>
	
	<cffunction name="updateList">
		<cfset getEmployeesBySkill(params.employeedropdown.dropskill)>
		
		<cfset employeedropdown=model("skills").new(params.employeedropdown)>
		<cfset full={time="full"}>
		<cfset newEmployee=model("employees").new(full)>			
		<cfset submitType="add">
		<cfset getSkills()>

		<cfset renderPage(action="index")>
	</cffunction>
	
	<cffunction name="editcats">
		<cfset getSkills()>
		<cfset cat=model("skills").new()>
	</cffunction>
	<cffunction name="addcat">
		<cfset cat=model("skills").new(params.cat)>
		<cfset cat.businessid = session.user.businessid>
		<cfset cat.save()>
		<cfif !cat.hasErrors()>
			<cfset cat=model("skills").new()>
		</cfif>
		<cfset getSkills()>
		<cfset renderPage(action="editcats")>
	
	</cffunction>
</cfcomponent>