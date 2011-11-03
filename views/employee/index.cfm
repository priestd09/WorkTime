<p id="mainDate"><img id="arrL" src="img/arrL.png"/><span id="dateW" class="fFont">oct 31 - Nov 6</span><img id="arrR" src="img/arrR.png"/><a class="ssFont" href="">Today</a></p>
<div id="calenderemployee">
	<cfoutput>#includePartial(partial="shifts")#</cfoutput>	
</div><!--close calender div -->

<cfoutput>
#linkto(text="Sign Out", controller="home", action="signout")#

<div id="underCal">

<div id="overAva">
<span class="tFont">overall availability </span>
<div id="staEndT">
	<span class="sFont" id="startS">start</span><span class="sFont">end</span>
</div>

#startFormTag(action="saveOverall")#
	#select(
	    label="Monday", objectName="day1", property="start", options = options
	)#
	#select(
	    label="", objectName="day1", property="end", options= options
	)#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall")#
	#select(
	    label="Tuesday", objectName="day2", property="start", options = options
	)#
	#select(
	    label="", objectName="day2", property="end", options= options
	)#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall")#
	#select(
	    label="Wednesday", objectName="day3", property="start", options = options
	)#
	#select(
	    label="", objectName="day3", property="end", options= options
	)#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall")#
	#select(
	    label="Thursday", objectName="day4", property="start", options = options
	)#
	#select(
	    label="", objectName="day4", property="end", options= options
	)#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall")#
	#select(
	    label="Friday", objectName="day5", property="start", options = options
	)#
	#select(
	    label="", objectName="day5", property="end", options= options
	)#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall")#
	#select(
	    label="Saturday", objectName="day6", property="start", options = options
	)#
	#select(
	    label="", objectName="day6", property="end", options= options
	)#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
#startFormTag(action="saveOverall")#
	#select(
	    label="Sunday", objectName="day7", property="start", options = options
	)#
	#select(
	    label="", objectName="day7", property="end", options= options
	)#
    #submitTag(value="Add Request", id="reqBtn", class="submitBtn bFont")#
#endFormTag()#
</div>
<!---- Jason did this, I know, gross --->

</cfoutput>


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