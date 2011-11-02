<cfoutput>
<h1>you are signed in :)</h1>

<cfif flashKeyExists("success")>
	#flash("success")#
</cfif>
</cfoutput>