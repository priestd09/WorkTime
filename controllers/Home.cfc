<cfcomponent extends="Controller">
	<cffunction name="landing">
	
		<!---- CHECK FOR BUSINESS ID IN PARAMS.KEY --->
		
		<cfset user= model("user").new()>
		<cfset newUser= model("user").new()>
		<cfif IsDefined("params.key")>
			<cfset session.user.businessid = params.key>
			<cfset session.user.usertypeid = 1>
		<cfelse>
			<cfset session.user.usertypeid = 2>
		</cfif>	
	</cffunction>
	
	
	<cffunction name="signin">
		<cfset user=model("user").findOne(where="email='#params.user.email#' AND password='#params.user.password#'", include="employee")>
		<cfif IsObject(user)>
			<cfset session.user.id = user.id>
			<cfset session.user.businessid = user.businessid>
			<cfset session.user.usertypeid = user.usertypeid>
			<cfif user.usertypeid eq 2>
				<cfset redirectTo(controller="business",action="index")>	
			<cfelseif user.usertypeid eq 1>
				<cfset session.user.employeeid =user.employee.id>
				<cfset redirectTo(controller="employee", action="index")>
			</cfif>
			
		<cfelse>
			<cfset newUser= model("user").new()>	
			<cfset user = model("user").new(email=params.user.email)>
			<cfset flashInsert(error="The email and password that you entered is not valid")>
			<cfset renderPage(action="landing")>
		</cfif>	
	</cffunction>
	
	
	<cffunction name="signup">

		<cfset newUser= model("user").new(params.newUser)>
		<cfset newUser.usertypeid = session.user.usertypeid>

		<cfif session.user.usertypeid eq 1>
			<cfset newUser.businessid = session.user.businessid>
		</cfif>
		<cfset newUser.save()>
<!--- 		<cfset thisuser = model("user").findOneByEmail(value="#newUser.email#")> --->
		<cfif newUser.hasErrors()>
			<cfset user= model("user").new()>
			<cfset renderPage(action="landing")>
		<cfelse>
			<cfif session.user.usertypeid eq 1>
				<cfset employees= model("employee").findAll()>
				<cfloop query="employees">
					<cfif employees.email eq params.newUser.email>
							<cfset employee=model("employee").findByKey(employees.id)>
							<cfset employee.userid=newUser.id>
							<cfset employee.save()>
					</cfif>
				</cfloop>
				<cfif employees.recordcount eq 0>
					<cfset redirectTo(controller="home", action="landing")> 
				</cfif>
				<cfset session.user.id = newUser.id>
				<cfset session.user.employeeid = employee.id>
				<cfset flashInsert(success="You've successfully registered :)")>
				<cfset redirectTo(controller="employee", action="index")>
			<cfelse>
				<cfset session.user.id = newUser.id>
				<cfset flashInsert(success="You've successfully registered :)")>
				<cfset redirectTo(controller="business", action="add")>
			</cfif>
		</cfif>
	
	</cffunction>
	
	<cffunction name="signout">
		<cfset  StructDelete(session, "user")>
		<cfset redirectTo(controller="home",action="landing")>
	
	</cffunction>
	
</cfcomponent>