<h1>HEY!</h1>


<cfdump var="#errorMessagesFor("test")#">
<cfdump var="#params.newEmployee#">
<cfdump var="#skills1#">
<cfoutput>

#errorMessagesFor("newSkills")#
#errorMessagesFor("newEmployee")#

#startFormTag(action="add")#

    #textField(label="Name", objectName="newEmployee", property="name")#
    #textField(label="Email", objectName="newEmployee", property="email")#
    <label for=""></label>
    #radioButton(label="Full-Time", objectName="newEmployee", property="time", labelPlacement="after", tagValue="full")#
    <label for=""></label>
    #radioButton(label="Part-Time", objectName="newEmployee", property="time", labelPlacement="after", tagValue="part")#
    <cfloop query="skills">
    	#hasManyCheckBox(objectName="newEmployee", label=skills.name, keys="#skills.id#", association="employeeskills")#
<!--- 		#checkBoxTag(name="#skills.name#", value="#skills.id#", label=skills.name)# --->
<!---     	#checkBox(label="#skills.name#", objectName="newSkills", property="skillid", labelPlacement="after", tagValue="#skills.id#")# --->
    </cfloop>
    <div>
        #submitTag()#
    </div>

#endFormTag()#

</cfoutput>


<!----


#select(
        label="Department", objectName="department", property="departmentId",
        options=departments
    )#

----->