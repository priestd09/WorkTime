<h1>HEY!</h1>
<cfoutput>
#errorMessagesFor("overallDay1")#

#startFormTag(action="addOverall")#
	#select(
	    label="Monday", objectName="overallDay", property="start",
	    options=hours
	)#
	#select(
	    label="", objectName="overallDay", property="end",
	    options=hours
	)#
    <div>
        #submitTag()#
    </div>

#endFormTag()#

#errorMessagesFor("offrequest1")#

#startFormTag(action="addRequest")#
	#textfield(label="Date", objectName="offrequest", property="date")#
	#select(
	    label="Monday", objectName="offrequest", property="start",
	    options=hours
	)#
	#select(
	    label="", objectName="offrequest", property="end",
	    options=hours
	)#
    <div>
        #submitTag()#
    </div>

#endFormTag()#
#linkto(text="Sign Out", controller="home", action="signout")#
</cfoutput>