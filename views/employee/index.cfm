<p id="mainDate"><img id="arrL" src="img/arrL.png"/><span id="dateW" class="fFont">oct 31 - Nov 6</span><img id="arrR" src="img/arrR.png"/><a class="ssFont" href="">Today</a></p>
<div id="calenderemployee">
	<div class="week">
		<p class="dayFont">Monday</p>
		<p class="empSkill emploMove fFont">Cashier</p>
		<p class="emploMove timesF">5pm - 10pm</p>
	</div>
		<div class="week">
		<p class="dayFont">Tuesday</p>
		<p class="empSkill emploMove fFont">Stock</p>
		<p class="emploMove timesF">10pm - midnight</p>

	</div>
		<div class="week">
		<p class="dayFont">Wednesday</p>
		<p class="empSkill emploMove"></p>
		
	</div>
		<div class="week">
		<p class="dayFont">Thursday</p>
		<p class="empSkill emploMove fFont">Stock</p>
		<p class="emploMove timesF">8am - noon</p>					
	</div>
	<div class="week">
		<p class="dayFont">Friday</p>
		<p class="empSkill emploMove fFont">Cashier</p>
		<p class="emploMove timesF">5pm - 10pm</p>
	</div>
	<div class="week">
	<p class="dayFont">Saturday</p>
	<p class="empSkill emploMove fFont">Stock</p>
	<p class="emploMove timesF">5pm - 10pm</p>
	</div>
	<div class="week">
	<p class="dayFont">Sunday</p>
	<p class="empSkill emploMove"></p>
	</div>
</div><!--close calender div -->

<cfdump var="#shifts#">

<cfloop query="shifts">
	
	<cfswitch expression="#shifts.day#">
		<cfcase value="1">
			<cfoutput>
				<div class="week">
					<p class="dayFont">Monday</p>
					<p class="empSkill emploMove fFont">#shifts.name#</p>
					<p class="emploMove timesF">#shifts.starttime# - #shifts.starttime#</p>
				</div>
			</cfoutput>
			<cfset day="Monday">
			<cfoutput>#shifts.day#</cfoutput>
		</cfcase>
		<cfcase value="2">

		</cfcase>
		<cfcase value="3">

		</cfcase>
		<cfcase value="4">

		</cfcase>
		<cfcase value="5">

		</cfcase>
		<cfcase value="6">

		</cfcase>
		<cfcase value="7">

		</cfcase>
	</cfswitch>
	
</cfloop>


<cfoutput>
#errorMessagesFor("overallDay1")#

#startFormTag(action="saveOverall")#
	#select(
	    label="Monday", objectName="overallDay", property="start",
	    options=hours
	)#
	#select(
	    label="", objectName="overallDay", property="end",
	    options=hours
	)#
    #submitTag(value="Add Request")#



#errorMessagesFor("offrequest1")#

#startFormTag(action="addRequest")#
	#textfield(label="Date", objectName="offrequest", property="date")#
	#select(
	    label="Sunday", objectName="offrequest", property="start",
	    options=hours
	)#
	#select(
	    label="", objectName="offrequest", property="end",
	    options=hours
	)#
    <div>
        #submitTag(value="Add Request")#
    </div>

#endFormTag()#
#linkto(text="Sign Out", controller="home", action="signout")#
</cfoutput>