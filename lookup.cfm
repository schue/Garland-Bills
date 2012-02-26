<!DOCTYPE html>
<html class="ui-mobile-rendering">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Garland Bills!</title>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
</head>
<body>

<cfset sess="#url.sess#">
<cfset chamber="#url.chamber#">
<cfset billid=UrlEncodedFormat("#url.billid#")>
<cfset billurl="http://openstates.org/api/v1/bills/tx/#sess#/#chamber#/#billid#">
<cfdump var="#billurl#">
<cfhttp url="#billurl#" method="get" result="result" charset="utf-8"> 
    <cfhttpparam type="formfield" name="apikey" value="XXXX_GET_YOUR_OWN_API_KEY_XXXX"> 
</cfhttp> 
<cfset content=result.filecontent.toString()>
<cfset json=DeSerializeJSON(content)>

<div data-role="page" class="type-home">
	<div data-role="content">
		<div class="content-primary">
			<p class="intro"><strong>Garland Bill Tracker:</strong> A quick and dirty Gov2.0 demo for the OpenCF community</p>
			<nav>


				<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
					<li data-role="list-divider">Bill: <cfoutput>#json.bill_id#</cfoutput></li>
					<li><cfoutput>#json.title#</cfoutput></li>

				</ul>
			</nav>
		</div>

		<div class="content-secondary">


			<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="f">
				<li data-role="list-divider">Overview</li>
				<cfloop index="i" from="1" to="#ArrayLen(json.actions)#">
				<cfset bill=json.actions[i]>
				<li><cfoutput>#bill.action#: #bill.date#</cfoutput></li>
				</cfloop>
			</ul>

		</div><!--/content-primary-->




	</div>

	<div data-role="footer" class="footer-docs" data-theme="c">
			<p>&copy; 2012 Open CF Party Crew</p>
	</div>

</div>
</body>
</html>
