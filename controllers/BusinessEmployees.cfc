<cfcomponent extends="Controller">
	<cffunction name="init">
		<!----<cfset test= model("employees")>Should be all lowercase and plural--->
		
	</cffunction>
	<cffunction name="index">
		<cfset newEmployee=model("employees").new()>
		<cfset newSkills=model("skills").new()>
			<cfset getSkills(1)>
	
	</cffunction>
	
	<cffunction name="add">
		<!--- use the form params :) DO NOT FORGET THE SKILLS!!!! --->
<!--- 		<cfset new = model("employees").create(name="Jason", email="j@s.com")> --->
		<cfset params.newEmployee.businessid = 1>
		<cfset model("employees").create(params.newEmployee)>
		<cfset skills1 = model("employeeskill").findAllByEmployeesid(value=10, include="skill")>
		<cfset index()>
		<cfset renderPage(action="index")>
<!--- 		<cfset skills = model("skills").findAllByBusinessid(value=1)> --->
	</cffunction>

	<cffunction name="edit">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="delete">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	
	<cffunction name="getEmployees">
		<cfargument name="id" required="false" type="numeric" hint="business id goes here">
		<cfset test= model("employees")>
		<cfset employees = test.findAllByBusinessid(value=id, include="Business")>
		<!--- This one also gets what it says it will :) --->
	</cffunction>
	
	<cffunction name="getEmployeesBySkill">
		<cfargument name="id" required="true" type="numeric" hint="business id goes here">
		<cfset test= model("employees")>
		<cfset x = test.findAllBySkillidAndBusinessid(value="1,2",include="EmployeeSkills(skill)")>
		<!--- This gets what it says it gets :) --->
	</cffunction>
	
	<cffunction name="getSkills">
		<cfargument name="id" required="true" type="numeric" hint="business id goes here">
		<cfset test= model("skills")>
		<cfset skills = test.findAllByBusinessid(value=id)>
	</cffunction>
	
	
	<cffunction name="addSkills">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="editSkills">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
</cfcomponent>