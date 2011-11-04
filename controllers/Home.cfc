<cfcomponent extends="Controller">
	<cffunction name="landing">
	
		<!---- CHECK FOR BUSINESS IDEA IN PARAMS.KEY --->
		
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
			<!------ TODO PUT EMPLOYEE ID IN THE SESSION---->			
			<cfif user.usertypeid eq 2>
				<cfset redirectTo(controller="business",action="index")>	
			<cfelseif user.usertypeid eq 1>
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
		<!---TODO MAKE THIS ADD THE USER ID TO THE EMPLOYEE --->
		<cfset newUser.save()>

		<cfif newUser.hasErrors()>
			<cfset user= model("user").new()>
			<cfset renderPage(action="landing")>
		<cfelse>	
			<cfset session.user.id = newUser.id>
			<cfset flashInsert(success="You've successfully registered :)")>
			<cfset redirectTo(controller="business", action="index")>
		</cfif>
	
	</cffunction>
	
	<cffunction name="signout">
		<cfset  StructDelete(session, "user")>
		<cfset redirectTo(controller="home",action="landing")>
	
	</cffunction>
	
</cfcomponent>