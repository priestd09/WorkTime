<cfcomponent extends="Controller">
	<cffunction name="hello">
		<cfset test= model("employees")><!--- Should be all lowercase and plural--->
		<cfset testFind = test.findAll(include="Business")><!--- should be Camel Case and singular--->
	</cffunction>
</cfcomponent>