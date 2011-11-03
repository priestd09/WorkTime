<cfcomponent extends="Controller">
	<cffunction name="index">
		<cfset newEmployee=model("employees").new()>
		<cfset newSkill = model("skills").new()>
		
		<cfset employeeskills=["Choose a Skill","Cashier","Stock"]>
		<cfset employeedropdown=model("skills").new()>
		<cfset submitType="add">
		
		
		<cfset getEmployees()>
		<cfset getSkills()>
	</cffunction>
	
	<cffunction name="add">
		<!--- DO NOT FORGET TO ADD OVERALLAVAILABILITYDAYS BASED ON BUSINESS HOURS FOR NEW EMPLOYEE --->
		
	</cffunction>

	<cffunction name="edit">
		<cfset newEmployee=model("employees").findByKey(params.key)>
		<cfset newSkill = model("skills").new()>
		<cfset employeeskills=["Choose a Skill","Cashier","Stock"]>
		<cfset employeedropdown=model("skills").new()>
		<cfset getEmployees()>
		<cfset getSkillsByEmployee()>
		<cfset getSkills()>
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
			<cfset getSkills()>
			<cfset getEmployees()>
			<cfset employeeskills=["Choose a Skill","Cashier","Stock"]>
			<cfset employeedropdown=model("skills").new()>
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
		<cfargument name="id" required="true" type="numeric" hint="business id goes here">
		<cfset test= model("employees")>
		<cfset x = test.findAllBySkillidAndBusinessid(value="1,2",include="EmployeeSkills(skill)")>
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
	
</cfcomponent>