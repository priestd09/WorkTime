<p id="mainDate"><img id="arrL" src="img/arrL.png"/><span id="dateW" class="fFont">oct 31 - Nov 6</span><img id="arrR" src="img/arrR.png"/><a class="ssFont" href="">Today</a></p>
<div id="calenderemployee">
	<cfoutput>#includePartial(partial="shifts")#</cfoutput>	
</div><!--close calender div -->

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

<div id="underCal">
				<div id="overAva">
					<span class="tFont">overall availability </span>
					
					<div id="staEndT">
						<span class="sFont" id="startS">start</span><span class="sFont">end</span>
					</div>
					<div id="daysD">
						<p><label class="sFont">mon</label></p>
						<p><label class="sFont">tue</label></p>
						<p><label class="sFont">wed</label></p>
						<p><label class="sFont">thur</label></p>
						<p><label class="sFont">fri</label></p>
						<p><label class="sFont">sat</label></p>
						<p><label class="sFont">sun</label></p>
					</div>	
					<div id="staT">
						<p><input class="sFont" value="8:00am" type="text"></p>
						<p><input class="sFont" value="8:00am" type="text"></p>
						<p><input class="sFont" value="8:00am" type="text"></p>
						<p><input class="sFont" value="8:00am" type="text"></p>
						<p><input class="sFont" value="8:00am" type="text"></p>
						<p><input class="sFont" value="8:00am" type="text"></p>
						<p><input class="sFont" value="8:00am" type="text"></p>
					</div>
					<div id="endT">
						<p><input class="sFont" value="8:00pm" type="text"></p>
						<p><input class="sFont" value="8:00pm" type="text"></p>
						<p><input class="sFont" value="8:00pm" type="text"></p>
						<p><input class="sFont" value="8:00pm" type="text"></p>
						<p><input class="sFont" value="8:00pm" type="text"></p>
						<p><input class="sFont" value="8:00pm" type="text"></p>
						<p><input class="sFont" value="8:00pm" type="text"></p>
					</div>
				</div>
				
				<div id="reqT">
					
						<span class="tFont">request time off </span>
					<div id="pDate">	
						<p class="fFont">date</p>
						<p><input id="dateField" class="empDate" type="text"><span id="cheB"><input id="cheB2" type="checkbox"></span></p>
						<p class="sFont">example mm-dd-yy</p>
					</div>
					
					<div id="pTime">	
					
					
					
					
					
					<div id="sTime">
					<span id="sTimeM"><label class="fFont">from</label></span>
						<form id="sTimespace">
							<select name="sTime">
								<option value="8:00">8:00am</option>
							</select>
						
						</form>	
					</div>
					<div id="sTime2">
					<span id="sTimeM2"><label class="fFont">to</label></span>
						<form>
							<select name="sTime">
								<option value="12:00">12:00pm</option>
							</select>
						
						</form>	
					</div>
				<!--
		
						<label class="fFont">to</label>
						<p><select name="eTimes">
							<option value="10:00pm">10:00pm</option>
						</select>
						</p>
-->

					
					</div>
						<button id="reqBtn" class="submitBtn bFont" type="submit">request time off</button>

				</div>
				<div class="currentR">
					<p class="tFont">current request </p>
					<div class="containerReq">
						<div class="pend">
							<span class="sFont">10-1-11</span><br/>
							<span class="sFont">8:00am - 9:00pm</span>
						</div>	
						<div class="subPend">
							<span class="sFont">pending</span>
							<p class="sFont"><a href="">edit</a></p>
						</div>
					</div>
					<p>
					<div class="containerReq wRow">
						<div class="pend">
							<span class="sFont">10-1-11</span><br/>
							<span class="sFont">8:00am - 9:00pm</span>
						</div>	
						<div class="subPend">
							<span class="sFont">pending</span>
							<p class="sFont"><a href="">edit</a></p>
						</div>
					</div>					
					</p>
					<p>
					<div class="containerReq">
						<div class="pend">
							<span class="sFont">10-1-11</span><br/>
							<span class="sFont">8:00am - 9:00pm</span>
						</div>	
						<div class="subPend">
							<span class="sFont">pending</span>
							<p class="sFont"><a href="">edit</a></p>
						</div>
					</div>					
					</p>
					
				</div>
				</div>
			</div>	<!-- undercal -->