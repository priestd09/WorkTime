<cfoutput>
#linkTo(text="back to employees",controller="businessemployees",action="index")#

<cfloop query="skills">
	<cfif IsDefined("skills.id")>
		<p>#skills.name#</p>
		#linkTo(text="delete",controller="businessemployees",action="deletecategory",key="#skills.id#")#
	</cfif>
</cfloop>
	#startFormTag(action="addcat")#
		#textField(objectName="cat", property="name", label="")#
	    #submitTag(class="submitBtn bFont",value="Add Category")#
	#endFormTag()#
</cfoutput>