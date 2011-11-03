<cfcomponent extends="Controller">
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
	<cffunction name="getWeek">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getDay">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="addWeek">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="addDay">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="addEmployeeShift">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="deleteEmployeeShift">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="editPublished">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getRequestCount">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getEmployees">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getEmployeeSkills">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
	<cffunction name="getRequests">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
</cfcomponent>