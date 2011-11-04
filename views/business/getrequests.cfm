<cfoutput>
	<p id="eRequ" class="tFont">employee request</p>
	<cfloop query="requests">
		<div class="currentR">
			<p>	
				<div class="containerReq conWidth">
			<div class="pend">
				<span class="sFont">#DateFormat(requests.date, "mmmm d, yyyy")#</span><br/>
				<span class="sFont">#requests.start# - #requests.end#</span>
			</div>	
			<div class="subPend">
				
				<p class="fFont">#requests.name#</p>
				
				</div>
			<div class="subPendLast">
				<p class="sFont">#linkTo(text="deny", controller="business", action="deny", key="#requests.id#")#</p>
				<p class="sFont">#linkTo(text="approve", controller="business", action="approve", key="#requests.id#")#</p>
			</div>
			</p>
		</div>
	</cfloop>
</cfoutput>

		
			
				
					