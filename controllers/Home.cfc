<cfcomponent extends="Controller">
	<cffunction name="landing">
	
	
	
	
	<cfset user= model("user").new()>
	<cfset newUser= model("user").new(usertypeid=2)>
	
<!--- 			<cfset newUser=model("user").new()> --->
		
	</cffunction>
	
	<cffunction name="signin">
		<cfset user=model("user").findOne(where="email='#params.user.email#' AND password='#params.user.password#'")>
		<cfif IsObject(user)>
			<cfset session.user.id = user.id>
			<cfset redirectTo(controller="business",action="index")>
		<cfelse>
			<cfset newUser= model("user").new()>	
			<cfset user = model("user").new(email=params.user.email)>
			<cfset flashInsert(error="The email and password that you entered is not valid")>
			<cfset renderPage(action="landing")>
		</cfif>	
	</cffunction>
	
	
	<cffunction name="signup">
	
		<cfset newUser= model("user").new(params.newUser)>
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