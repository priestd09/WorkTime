<cfcomponent extends="Controller">
	<cffunction name="index">
		<cfset newEmployee=model("employees").new()>
		<cfset newSkill = model("skills").new()>
		<cfset employeeskills=["Choose a Skill","Cashier","Stock"]>
		<cfset employeedropdown=model("skills").new()>
		<cfset getEmployees()>
		<cfset getSkills(1)>
	</cffunction>
	
	<cffunction name="add">
		<!--- DO NOT FORGET TO ADD OVERALLAVAILABILITYDAYS BASED ON BUSINESS HOURS FOR NEW EMPLOYEE --->
		
	</cffunction>

	<cffunction name="edit">
		<cfset newEmployee=model()>
	</cffunction>
	<cffunction name="update">
	<!--- use the form params :) DO NOT FORGET THE SKILLS!!!! --->
		<!---<cfset new = model("employees").create(name="Jason", email="j@s.com")> --->
		<cfset id = params.newEmployee.id>
		<cfset checkedSkills2=params.checkedSkills>
		<cfloop collection=#checkedSkills2# item="skill">
			<!--- RUN EMPLOYEESKILL UPDATE FUNCTION HERE using #skill# as the id for the skill--->
			
		</cfloop>
		<cfset newEmployee = model("employees").new(params.newEmployee)>
		<cfset newEmployee.businessid = 1>
		<cfset newEmployee.updateByKey(id, params.newEmployee)>
		<!--- <cfset model("employeeskills").save(params.newEmployee.employeeskil)> --->
		<cfset skills1 = model("employeeskill").findAllByEmployeesid(value=10, include="skill")>
				<cfset getSkills(1)>

		<cfset renderPage(action="index")>
		<!--- <cfset skills = model("skills").findAllByBusinessid(value=1)> --->
	
	</cffunction>
	
	<cffunction name="delete">
		<cfset id = params.newEmployee.id>
		<cfset newEmployee = model("employees").findOneById(id)>
		<cfset newEmployee.delete()>
		<cfset renderPage(action="index")>
	</cffunction>
	
	<cffunction name="getEmployees">
		<cfdump var="#session#"><cfabort>
		<cfset employees= model("employees").findAllByBusinessid(value=session.user.businessid, include="Business")>
	</cffunction>
	
	<cffunction name="getEmployeesBySkill">
		<cfargument name="id" required="true" type="numeric" hint="business id goes here">
		<cfset test= model("employees")>
		<cfset x = test.findAllBySkillidAndBusinessid(value="1,2",include="EmployeeSkills(skill)")>
		<!--- This gets what it says it gets :) --->
	</cffunction>
	
	<cffunction name="getSkills">
		<cfargument name="id" required="true" type="numeric" hint="business id goes here">
		<cfset test = model("skills")>
		<cfset skills = test.findAllByBusinessid(value=id)>
	</cffunction>
	
	<cffunction name="addSkills">
	<!--- ADDING A SKILL --->
		<cfset newSkill = model("skills").new()>
		<cfset newSkill=model("skills").new(params.newSkill)>
		<cfset newSkill.businessid = 1>
		<cfset newSkill.save()>
		
<!--- 		<cfset test2 = model("skills").save(params.newSkill)> --->
<!--- 		<cfset aSkill = test2.save(params.newSkill)> --->
		<cfset renderPage(action="index")>
	</cffunction>
	
	
	
	<cffunction name="editSkills">
		
	</cffunction>
	
</cfcomponent>