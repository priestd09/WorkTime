<!---
	If you leave these settings commented out, Wheels will set the data source name to the same name as the folder the application resides in.
	<cfset set(dataSourceName="")>
	<cfset set(dataSourceUserName="")>
	<cfset set(dataSourcePassword="")> 
--->

<!---
	If you leave this setting commented out, Wheels will try to determine the URL rewrite capabilities automatically.
	The URLRewriting setting can bet set to "On", "Partial" or "Off".
	To run with "Partial" rewriting, the "PATH_INFO" variable needs to be supported by the web server.
	To run with rewriting "On", you need to apply the necessary rewrite rules on the web server first.
	<cfset set(URLRewriting="Partial")>
--->
<cfset set(cacheModelInitialization=false)>
<cfset set(cacheDatabaseSchema=false)>
<cfset set(URLRewriting="On")>
<cfset application.reCaptcha.publicKey = "6LcywskSAAAAALeW3HZljC-pS2JePqI1Li5o5YlY">
<cfset application.reCaptcha.privateKey = "6LcywskSAAAAANgKyD9z3ru9NYHs2mCF6ywO2Eoq">

<cfset set(
    functionName="sendEmail",
    server="smtp.gmail.com",
    username="jlvanderslice@gmail.com",
    password=""
)>