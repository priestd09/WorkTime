<cfoutput>
<div id="createEmp">
	<p id="cNew" class="tFont">create new employees</p><span  id="rentEmp" class="tFont">current employees</span>
	<div id="newEmploy">	
		#startFormTag(action="#submitType#")#
		<div id="newEmpSkill" class="ffFont">
			<p><span class="fFont">business categories</span><span class="ssFont" id="bEdit"><a href="">edit</a></span></p>
			<cfloop query="skills">
				<cfif IsDefined("skills.id")>
				 #checkBoxTag(name="checkedSkills[#skills.id#]", value=skills.id, label=skills.name,  labelPlacement="after",class="cheCat", appendToLabel="<br/>", checked=skills.checked)#
				 </cfif>
			</cfloop>
		</div>
		<div id="newEmpSkill2nd">
					<div id="empNames">
						<div id="empNames2">
							<p id="namM" class="fFont">
								#textField(label="Name", objectName="newEmployee", property="name", class="fInput", labelPlacement="before", appendToLabel="<br/>")#
	   						</p>
	   						<p id="namM2" class="sFont">add your employees name here</p>
	   						<p id="emaM" class="fFont">
	   						#textField(label="Email", objectName="newEmployee", property="email",class="fInput", labelPlacement="before", appendToLabel="<br/>")#
	    <br/><label class="fFont">they are</label><br/>
	    	<div class="ffFont">
	   			#radioButton(label="Full-Time", objectName="newEmployee", property="time", labelPlacement="after", tagValue="full", class="rBtn" )#
	    		#radioButton(label="Part-Time", objectName="newEmployee", property="time", labelPlacement="after", tagValue="part", class="rBtn")#
	    	</div>
	    <div>
	    	#hiddenField(objectName="newEmployee", property="id")#
	    	#hiddenField(objectName="newEmployee", property="userid")#
	        #submitTag(class="submitBtn bFont",value="Add Employee")#
	    </div>
	    #endFormTag()#
	</div>
</div></div>
</div>

<div id="currEmp">
		#select(objectName="employeedropdown", property="employee",options=employeeskills,label="")#
		<cfloop query="employees">
				<p>#employees.name#</p>
				#linkTo(text="edit",controller="businessemployees",action="edit",key=employees.id)#
		</cfloop>
</div>



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