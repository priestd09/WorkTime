<cfdump var="#days#">
<cfoutput>
	<cfloop query="days">
		#days.start#
		#days.end#
	</cfloop>
</cfoutput>

<cfdump var="#requests#">
<cfoutput>
	<cfloop query="requests">
		#days.start#
		#days.end#
	</cfloop>
</cfoutput>