<!--- <cfinclude template="../../tests/test1.cfm"> --->
<!--- <cfset test = newturtle> --->
<!--- <cfset employees = model("employees").findAll()> --->
<cfset test = new mxunit.doc.worktime.tests.test()>
<cfset test.runtestremote()>