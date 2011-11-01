<cfcomponent extends="Controller">
	<cffunction name="init">
		<cfset test= model("employees")><!--- Should be all lowercase and plural--->
		<cfset testFind = test.findAll(include="Business")><!--- should be Camel Case and singular--->
	</cffunction>
	<cffunction name="index">
	
		<cfset add()>
	
	</cffunction>
	
	<cffunction name="add"><!--- add the skills, name, email and time--->
		
		<!--- use the form params :) --->
		
		<cfset newEmployee = model("employees").new()>
		
		<cfset newEmployee.businessid = 1>
		<cfset newEmployee.email = "jlvanderslice@gmail.com">
		<cfset newEmployee.name = "Jim Vanderslice">
		<cfset newEmployee.time = "full">
		<cfset newEmployee.save()>
		
	</cffunction>
	<cffunction name="edit"><!--- returns the name, email, time and skills--->
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="delete">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	
	<cffunction name="getEmployees">
		<cfargument name="id" required="true" type="numeric" hint="business id goes here">
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