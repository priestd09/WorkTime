<h1>HEY!</h1>

<!--- <cfdump var="#checkedSkills2#"> --->

<cfoutput>

<!--- #errorMessagesFor("newSkill")# --->

#startFormTag(action="add")#

    #textField(label="Name", objectName="newEmployee", property="name")#
    #textField(label="Email", objectName="newEmployee", property="email")#
    <label for=""></label>
    #radioButton(label="Full-Time", objectName="newEmployee", property="time", labelPlacement="after", tagValue="full")#
    <label for=""></label>
    #radioButton(label="Part-Time", objectName="newEmployee", property="time", labelPlacement="after", tagValue="part")#
	<cfloop query="skills">
<!---     	#hasManyCheckBox(objectName="newEmployee", label=skills.name, keys="#skills.id#", association="employeeskills")# --->
    	 #checkBoxTag(name="checkedSkills[#skills.id#]", value=skills.id, label=skills.name)#
    </cfloop>

    <div>
    	#hiddenField(objectName="newEmployee", property="id")#
    	#hiddenField(objectName="newEmployee", property="userid")#
        #submitTag()#
    </div>


#endFormTag()#

<!---

#startFormTag(action="addSkills")#
	#textField(label="Skill Name", objectName="newSkill", property="name")#
	#submitTag()#
#endFormTag()#
--->

</cfoutput>


<!----


#select(
        label="Department", objectName="department", property="departmentId",
        options=departments
    )#

----->