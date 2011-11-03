<cfoutput>
	<cfloop collection=#weeks# item="day">
		<div class="week">
			<p class="dayFont">#day#</p>
			<cfloop array="#weeks[day]#" index="shift">
				<p class="empSkill emploMove fFont">#shift.name#</p>
				<p class="emploMove timesF">#shift.start# - #shift.end#</p>
			</cfloop>		
		</div>
	</cfloop>
</cfoutput>
