<cfoutput>
<h1>you are signed in :)</h1>
<div class="move"><cfoutput>#linkto(text="Sign Out", controller="home", action="signout")#</cfoutput></div>
<cfoutput>#linkto(text="Add/Edit Employees", controller="businessemployees", action="index")#<br />
#linkto(text="Requests", controller="business", action="getrequests")#
</cfoutput>
<cfif flashKeyExists("success")>
	#flash("success")#
</cfif>
<div id="dayListTop">
<div class="dayList">
	<cfloop collection=#weeks# item="day">
		<p class="tFont">#day#</p>
		
		<div id="calenderDay">
			<cfloop array="#weeks[day]#" index="shift">
				<div class="cDay">
					<p class="empSkill emploMove fFont">#shift.start# - #shift.end#</p>
					
				
				</div>
			</cfloop>
		</div><!--close calender div -->
		
	</cfloop>

	<p id="mainDateDays" class="ffFont">oct 31 - Nov 6</p>
			
	
			

			
				
				<div class="cDay">
					<p class="empSkill emploMove fFont">noon - 5pm</p>
					<p class="emploMove timesF">4 Cashers</p>
					<p class="emploMove timesF">5 Stock</p>
					<p class="emploMove timesF">4 Mangers</p>
				</div>
				<div class="cDay">
					<p class="empSkill emploMove fFont">5 - 10pm</p>
					<p class="emploMove timesF">4 Cashers</p>
					<p class="emploMove timesF">5 Stock</p>					
					<p class="emploMove timesF">4 Managers</p>						
				</div>
				<div class="cDay">
					<p class="empSkill emploMove fFont">5 - 10pm</p>
					<p class="emploMove timesF">4 Cashers</p>
					<p class="emploMove timesF">5 Stock</p>					
					<p class="emploMove timesF">4 Managers</p>					
				</div>

			
		</div><!-- close daylist	 -->	
		
		<div class="dayList">
			<p class="tFont">tuesday, Nov 1</p>

			<div id="calenderDay">
				<div class="cDay">
					<p class="empSkill emploMove fFont">5pm - 10pm</p>
					<p class="emploMove timesF">4 Cashers</p>
					<p class="emploMove timesF">5 Stock</p>
					<p class="emploMove timesF">4 Managers</p>
				</div>
				<div class="cDay">
					<p class="empSkill emploMove fFont">noon - 5pm</p>
					<p class="emploMove timesF">4 Cashers</p>
					<p class="emploMove timesF">5 Stock</p>
					<p class="emploMove timesF">4 Mangers</p>
				</div>
				<div class="cDay">
					<p class="empSkill emploMove fFont">5 - 10pm</p>
					<p class="emploMove timesF">4 Cashers</p>
					<p class="emploMove timesF">5 Stock</p>					
					<p class="emploMove timesF">4 Managers</p>						
				</div>
			</div><!--close calender div -->




</cfoutput>