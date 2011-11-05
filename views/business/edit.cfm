<cfoutput>
</div>
#startFormTag(action="update")#
#errorMessagesFor("business")#

<div id="createB">
	<div id="nameFi" class="fFont">
		#textField(label="name", objectName="business", property="name", class="fInput", labelPlacement="before")#
	</div>
		<p id="bussName" class="sFont">your business name here</p>
	<div id="hrFi" class="fFont">schedule hours</div>
	<div id="hour">
		<div class="sTimeid">
			#select(label="", objectName="businessdays", property="starttime",options=hoursOption, labelPlacement="before")#
			<p class="ffFont">start</p>		
		</div>
		<div class="sTimeid">
			#select(label="", objectName="businessdays", property="endtime",options=hoursOption, labelPlacement="before")#
			<p class="ffFont">end</p>
		</div>
		<input type="hidden" id="businessdays-day" name="businessdays[day]" value="all">
	</div>
<!--- SOMETIME IN THE FUTURE ADD FUNCTIONALITY TO BE ABLE TO CHOOSE EACH DAY'S START AND END TIME--->
<!--- 	<p id="arrOp"><img src="/worktime/images/arrR.png"/><a href="" class="ffFont deco">click for advanced hours</a></p> --->
	<div id="shiftFi">
		<div id="shiftFi1">
			<div class="sTimeid fFont">
				#select(label="shift length", objectName="business", property="shiftlength",options=shiftHoursOption, labelPlacement="before")#
			</div>
			<div class="sTimeid fFont">
				#select(label="over time", objectName="business", property="overtime",options=timeHours, labelPlacement="before")#
			</div>
		</div>
		<div id="shiftFi2">
			<div class="sTimeid fFont">
				#select(label="full time", objectName="business", property="fulltime",options=timeHours, labelPlacement="before")#
			</div>
			<div class="sTimeid fFont">
				#select(label="part time", objectName="business", property="parttime",options=timeHours, labelPlacement="before")#
			</div>
		</div>
	</div>
	<div class="move">
	#showCaptcha(captchaError=captchaError)#
	</div>
	#submitTag(value="update business", class="submitBtn bFont")#
</div>
#endFormTag()#
</cfoutput>					

					
						