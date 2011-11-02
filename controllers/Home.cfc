<cfcomponent extends="Controller">
	<cffunction name="index">
	
			<cfset user= model("user").new()>
<!--- 			<cfset newUser=model("user").new()> --->
		
	</cffunction>
	<cffunction name="signin">
		<cfset user=model("user").findOne(where="email='#params.user.email#' AND password='#params.user.password#'")>
		<cfif IsObject(user)>
			<cfset session.user.id = user.id>
		<cfelse>
			<cfset user = model("user").new(email=params.user.email)>
			<cfset flashInsert(error="The email and password that you entered is not valid")>
			<cfset renderPage(action="index")>
		</cfif>
		
	</cffunction>
	<cffunction name="signup">
		<cfset test= model("employees")>
		<cfset testFind = test.findAll(include="Business")>
	</cffunction>
</cfcomponent>