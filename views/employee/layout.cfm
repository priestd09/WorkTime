<!--- Place HTML here that should be used as the default layout of your application --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>WorkTime</title>
		
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />  
  		
 		<link rel="stylesheet" href="/worktime/stylesheets/web.css" type="text/css" /> 

		</head>
		
		<body>
		<div id="wrapper">
		<div id="content">
			<div id="header">
				
				<div class="move"><p id="imgAdjLo"><img src="/worktime/images/lo.jpg"/></p></div>
				<cfoutput>#linkto(text="Sign Out", controller="home", action="signout")#</cfoutput>

			</div>
			<cfoutput>#includeContent()#</cfoutput>
			
			
		</div>	<!-- content -->
		</div><!-- closewrapper -->
		
		<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js' type='text/javascript'></script>
    	<script src='javascripts/jquery-ui-1.7.3.custom.min.js' type='text/javascript'></script>

    	<script src='javascripts/main.js' type='text/javascript'></script>

    			
	</body>
</html>