<div id="calenderemployee">
	<cfoutput>#includePartial(partial="shifts")#</cfoutput>	
</div><!--close calender div -->

<cfoutput>

<div id="underCal">
<a href="?format=pdf">Download PDF</a>
<a href="?format=xml">View as XML</a>
<div id="overAva">
<span class="tFont">overall availability </span>
<div id="staEndT">
	<span class="sFont" id="startS">start</span><span class="sFont">end</span>
</div>

#startFormTag(action="saveOverall", key="1")#
	#select(
	    label="Monday", objectName="day1", property="start", options = options, labelPlacement="before"
	)#
	#select(
	    label="", objectName="day1", property="end", options= options, labelPlacement="before"
	)#
	#hiddenField(objectName="day1", property="id")#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall", key="2")#
	#select(
	    label="Tuesday", objectName="day2", property="start", options = options, labelPlacement="before"
	)#
	#select(
	    label="", objectName="day2", property="end", options= options, labelPlacement="before"
	)#
	#hiddenField(objectName="day2", property="id")#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall", key="3")#
	#select(
	    label="Wednesday", objectName="day3", property="start", options = options, labelPlacement="before"
	)#
	#select(
	    label="", objectName="day3", property="end", options= options, labelPlacement="before"
	)#
	#hiddenField(objectName="day3", property="id")#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall", key="4")#
	#select(
	    label="Thursday", objectName="day4", property="start", options = options, labelPlacement="before"
	)#
	#select(
	    label="", objectName="day4", property="end", options= options, labelPlacement="before"
	)#
	#hiddenField(objectName="day4", property="id")#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall", key="5")#
	#select(
	    label="Friday", objectName="day5", property="start", options = options, labelPlacement="before"
	)#
	#select(
	    label="", objectName="day5", property="end", options= options, labelPlacement="before"
	)#
	#hiddenField(objectName="day5", property="id")#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall", key="6")#
	#select(
	    label="Saturday", objectName="day6", property="start", options = options, labelPlacement="before"
	)#
	#select(
	    label="", objectName="day6", property="end", options= options, labelPlacement="before"
	)#
	#hiddenField(objectName="day6", property="id")#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall", key="7")#
	#select(
	    label="Sunday", objectName="day7", property="start", options = options, labelPlacement="before"
	)#
	#select(
	    label="", objectName="day7", property="end", options= options, labelPlacement="before"
	)#
	#hiddenField(objectName="day7", property="id")#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
</div>

<div id="reqT">
			
	<span class="tFont">request time off </span>
	<div id="sTime">
	<div id="pDate">	
		#startFormTag(action="addRequest")#
			#textField(label="date", objectName="offrequest", property="date")#
			#select(
			    label="from", objectName="offrequest", property="start", options = options
			)#
			#select(
			    label="to", objectName="offrequest", property="end", options= options
			)#
			#hiddenField(objectName="offrequest", property="id")#
		    #submitTag(value="request time off", id="reqBtn", class="submitBtn bFont")#
		#endFormTag()#
	</div>
</div>
</div>
<!--- showing the current requests --->

<div class="currentR">
	<p class="tFont">current request</p>
		<cfloop query="requests">
	<div class="containerReq">
			
		<div class="pend">
			<span class="sFont">#DateFormat(requests.date, "mmmm d, yyyy")#</span><br/>
			<span class="sFont">#requests.start# - #requests.end#</span>
		</div>	
		<div class="subPend">
			<span class="sFont">#requests.pending#</span>
			<p class="sFont">#linkTo(text="edit", controller="employee", action="editRequest", key="#requests.id#")#</p>
		</div>
	</div>
</cfloop>

</div>

</cfoutput>
