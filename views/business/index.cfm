<cfoutput>
<h1>you are signed in :)</h1>
<div class="move">#linkto(text="Sign Out", controller="home", action="signout")#</div>
#linkto(text="Add/Edit Employees", controller="businessemployees", action="index")#<br />
#linkto(text="Requests", controller="business", action="getrequests")#
</div>
<cfif flashKeyExists("success")>
	#flash("success")#
</cfif>
<div id="dayListTop">
<div class="dayList">	
	<cfloop array="#dayNames#" index="day">
		<p class="tFont">#day#</p>
		<div id="calenderDay">
			<cfloop array="#weeks[day]#" index="shift">
				
				<div class="cDay" data="#shift.id#">
					<p class="empSkill emploMove fFont">#shift.start# - #shift.end#</p>
					<cfloop collection=#shift.skills# item="skill">
					
						<p class="emploMove timesF">#shift.skills[skill].count# #shift.skills[skill].name#</p>
					</cfloop> 
				
				</div>
			</cfloop>
		</div><!--close calender div -->
	</cfloop>
	</div>
	</div>
	
	
	<div id="currEmp">
		#startFormTag(action="updateList")#
			#select(objectName="employeedropdown", property="dropskill",options=skills,label="")#
	        #submitTag(class="submitBtn bFont",value="Update")#
		#endFormTag()#

<!--- 	<cfdump var="#employees#"><cfabort> --->
			<cfloop query="employees">
					<p class="#employees.employeesid# #employees.employeesid#">#employees.name#</p>
			</cfloop>
			
	</div>
	<!----
	<div id="detaildropMenu">
		
				<form>
					<select name="sTime">
						<option value="choose an employee category">choose an employee category</option>
						<option value="Joe Smith">Joe Smith</option>
						<option value="Joe Smith">Joe Smith</option>
						<option value="Joe Smith">Joe Smith</option>
					</select>
						
				</form>	

		
		</div><!-- closedetaildropmenu -->
	---->
	
	
	
</cfoutput>