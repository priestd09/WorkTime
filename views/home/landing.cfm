<cfoutput>

<!--- <cfdump var="#newUser#"><cfabort> --->

#startFormTag(action="signin")#
	<div class="move fFont">
    	#textField(label="email", labelPlacement="before", appendToLabel="</br>", objectName="user", property="email", class="fInput")#
    </div>
    <div class="move fFont">
    	#passwordField(label="password", labelPlacement="before", appendToLabel="</br>", objectName="user", property="password", class="fInput")#
    </div>
    <div class="move">
    	<p>#submitTag(class="submitBtn bFont adjBtn", value="sign in")#</p>
    </div>
#endFormTag()#
</cfoutput>

</div><!-- closeheader -->
<div id="left">
	<p id="imgAdj"><img src="/worktime/images/gra.jpg"/></p>
<div id="subleft">

	<p class="tFont">organization</p>
	<ul class="clocks ffFont">
		<li>Group employees by skill</li>
		<li>See who is available that week</li>
		<li>Create calendars ahead of time</li>
	</ul>
</div>	
<div id="subleft2">
	<p class="tFont">always there</p>
	<ul class="clocks ffFont">
		<li>Around the clock access to schedule</li>
		<li>Employees no longer have to call in</li>
	</ul>
</div>
</div><!-- closeleft div -->

<div id="right">
	<p id="ben" class="tFont">benefits</p>
	<ul class="clocks ffFont">
		<li>Simple interface to learn</li>
		<li>Tedious tasks made easy</li>
		<li>Powerful and dynamic</li>
	</ul>
<cfoutput>
	
	<div id="signUp">
	<div id="signPos">

#startFormTag(action="signup")#

#errorMessagesFor("newUser")#
		<p class="tFont ">sign up</p>
		<p class="fFont pMove">#textField(class="fInput", label="email", objectName="newUser", property="email")#</p>
		<p class="sFont">example:name@domain.com</p>
		
		<p class="fFont pMove">#passwordField(class="fInput", label="password", objectName="newUser", property="password")#</p>
		<p class="sFont">At least 6 characters long</p>
<!--- 		<label class="fFont">my role is</label><br/> --->
<!--- 		#radioButton(label="business", objectName="newUser", property="usertypeid", labelPlacement="after", tagValue=2)# --->
<!--- 		#radioButton(label="employee", objectName="newUser", property="usertypeid", labelPlacement="after", tagValue=1)# --->
		#submitTag(value="sign up", class="submitBtn bFont")#
		
    </div> <!--- closes signPOS --->
    </div> <!--- closes signUp --->	
  
  #endFormTag()#  

</cfoutput>	



	
</div><!-- closeright div -->