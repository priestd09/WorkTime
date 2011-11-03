<p id="mainDate"><img id="arrL" src="img/arrL.png"/><span id="dateW" class="fFont">oct 31 - Nov 6</span><img id="arrR" src="img/arrR.png"/><a class="ssFont" href="">Today</a></p>
<div id="calenderemployee">
	<cfoutput>#includePartial(partial="shifts")#</cfoutput>	
</div><!--close calender div -->

<!--- <cfdump var="#shifts#"> --->

<!----
<cfloop query="shifts">	

	
</cfloop>

---->

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