<cfoutput>

<cfif flashKeyExists("success")>
	#flash("success")#
</cfif>
<cfif IsDefined("session.user.businessid")>
	<div id="dayListTop">
	<div class="dayList">	
		<cfloop array="#dayNames#" index="day">
			<p class="tFont">#day#</p>
			<div id="calenderDay">
				<cfloop array="#weeks[day]#" index="shift">
					
					<div class="cDay" data="#shift.id#">
						<p class="empSkill emploMove fFont">#shift.start#00 - #shift.end#00</p>
						<cfloop collection=#shift.skills# item="skill">
						
							<p class="emploMove timesF">#shift.skills[skill].count# #shift.skills[skill].name#</p>
						</cfloop> 
					
					</div>
				</cfloop>
			</div><!--close calender div -->
		</cfloop>
</cfif>
	</div>
	</div>
	
<cfif IsDefined("session.user.businessid")>
	<div id="currEmp">
		#startFormTag(action="redirectToKey")#
			#select(objectName="employeedropdown", property="id",options=skills,label="")#
	        #submitTag(class="submitBtn bFont",value="Update")#
		#endFormTag()#

		<cfloop query="employees">
			<p class="draggEmp" employeeid="#employees.employeesid#" skillid="#employees.skillid#">#employees.name#</p>
		</cfloop>
</cfif>
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