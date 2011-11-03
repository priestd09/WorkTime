<cfoutput>
<h1>you are signed in :)</h1>
				<div class="move"><cfoutput>#linkto(text="Sign Out", controller="home", action="signout")#</cfoutput></div>
<cfdump var="#session#">
<cfoutput>#linkto(text="Add/Edit Employees", controller="businessemployees", action="index")#</cfoutput>
<cfif flashKeyExists("success")>
	#flash("success")#
	
</cfif>
</cfoutput>