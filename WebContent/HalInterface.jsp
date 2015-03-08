<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HAL 9000</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.8.1/mustache.js"></script>
<style>
.aiBackground
{
	background: #000;
}
body{
	height: 100%;
	float: left;
}
.aiContainer
{
	position: relative;
	float: left;
	margin: 0px 150px;
	border: 2px solid gray;
	background: black;
	min-height: 500px;
	padding-bottom: 120px;
}
.aiMessagingContainer
{
	float: right;
	border: 1px solid blue;
	min-height: 500px;
	
	overflow-y: scroll;
	
	font-family: Courier;
	text-transform: uppercase;
	background: #0000AA;
	color: white;
}
.halHeader
{
	font-family: Arial;
	position: relative;
	float: left;
	horizontal-align: center;
	margin: 25px 25px 10px;
	clear:both;
	border: 3px solid white;
}
.halHeader div
{
	padding: 7px 9px 7px;
	background: black;
	border: 1px solid white;
	color: white;	
	width: 100px;
	float: left;
	font-size: 24px;
}
.halHeader div:first-child
{
	background: #7393DE;
	text-align: right;
	border: 1px 1px 1px 0 solid white;
	color: white;
}
.renderHal 
{
	float: left;
	clear: both;
	horizontal-align: center;
	margin-top: 100px;
	width: 300px;
	height: 300px;

	background: #b9c141; /* Old browsers */
	background: -moz-radial-gradient(center, ellipse cover,  #b9c141 0%, #f72d00 11%, #f72d00 12%, #c13724 29%, #050100 50%, #8c8c8c 51%, #727272 60%, #000000 61%, #070504 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,#b9c141), color-stop(11%,#f72d00), color-stop(12%,#f72d00), color-stop(29%,#c13724), color-stop(50%,#050100), color-stop(51%,#8c8c8c), color-stop(60%,#727272), color-stop(61%,#000000), color-stop(100%,#070504)); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover,  #b9c141 0%,#f72d00 11%,#f72d00 12%,#c13724 29%,#050100 50%,#8c8c8c 51%,#727272 60%,#000000 61%,#070504 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover,  #b9c141 0%,#f72d00 11%,#f72d00 12%,#c13724 29%,#050100 50%,#8c8c8c 51%,#727272 60%,#000000 61%,#070504 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover,  #b9c141 0%,#f72d00 11%,#f72d00 12%,#c13724 29%,#050100 50%,#8c8c8c 51%,#727272 60%,#000000 61%,#070504 100%); /* IE10+ */
	background: radial-gradient(ellipse at center,  #b9c141 0%,#f72d00 11%,#f72d00 12%,#c13724 29%,#050100 50%,#8c8c8c 51%,#727272 60%,#000000 61%,#070504 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b9c141', endColorstr='#070504',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

}
.halSubdued
{
		background: #b9c141; /* Old browsers */
	background: -moz-radial-gradient(center, ellipse cover,  #b9c141 0%, #f72d00 11%, #f72d00 12%, #c13724 29%, #050100 30%, #050100 50%, #8c8c8c 51%, #727272 60%, #000000 61%, #070504 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,#b9c141), color-stop(11%,#f72d00), color-stop(12%,#f72d00), color-stop(29%,#c13724), color-stop(30%,#050100), color-stop(50%,#050100), color-stop(51%,#8c8c8c), color-stop(60%,#727272), color-stop(61%,#000000), color-stop(100%,#070504)); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover,  #b9c141 0%,#f72d00 11%,#f72d00 12%,#c13724 29%,#050100 30%,#050100 50%,#8c8c8c 51%,#727272 60%,#000000 61%,#070504 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover,  #b9c141 0%,#f72d00 11%,#f72d00 12%,#c13724 29%,#050100 30%,#050100 50%,#8c8c8c 51%,#727272 60%,#000000 61%,#070504 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover,  #b9c141 0%,#f72d00 11%,#f72d00 12%,#c13724 29%,#050100 30%,#050100 50%,#8c8c8c 51%,#727272 60%,#000000 61%,#070504 100%); /* IE10+ */
	background: radial-gradient(ellipse at center,  #b9c141 0%,#f72d00 11%,#f72d00 12%,#c13724 29%,#050100 30%,#050100 50%,#8c8c8c 51%,#727272 60%,#000000 61%,#070504 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b9c141', endColorstr='#070504',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

}
.halSpeaker
{
	background: #333;
	border: 1px solid gray;
	height: 120px;
	width: 300px;
	position: absolute;
	bottom: 0;
	clear: both;
}
.aiCommandTextbox
{
	float: left;
	clear: both;
	margin: 0px 4px 19px;
	border-bottom: 1px solid white;
	border-top: none;
	border-left: none;
	border-right: none;
	color: white;
	background: #0000AA;
	padding: 0 3px;
	font-size: 18pt;
}
.msgFormat
{
	word-wrap: break-word;
	padding: 10px 0;
	width: 400px;
	text-transform: uppercase;
}
</style>
<script type="text/javascript">
    var startCommand = "ready";
	var supportedCommands = ["higher", "lower"];
	var successfulTerminationCommand = "yes";
	
	var guesses = new Array();
	var responses = new Array();
	var usersName = "";
	var inputId = "aiCommand";
	var numSeconds = 10;
	
	$(function(){
		var windowWidth = $(window).width();
		var windowHeight = $(window).height();
		var speakerHeight = 120;
		$(".aiContainer").height(windowHeight - (20 + speakerHeight));
		$(".aiMessagingContainer").height(windowHeight - 20);
		
		var initialMsg = {
				speaker: "HAL",
				message: "What is your name?"
			}; 
		
		//begin program - determine user
		publishMessage(initialMsg);
		
		$("#"+inputId).on('keyup paste', function(e){
			
			//enter has been pressed begin processing
			//TODO: add logic for paste detection
			if((e.keyCode || e.which) == 13)
			{
				//make sure to make case insensitive - to Lower
				var inputVal = $("#"+inputId).val();
				var aiCommand = inputVal.toLowerCase();
				
				if(responses.length == 0)
				{
					console.log(inputVal)
					
					usersName = inputVal;
					
					var userMsg = {
							speaker: "User",
							message: usersName							
					}
					//publish user response
					publishMessage(userMsg);
					
					//store response
					responses.push(usersName);
					
					//clear the text box
					$("#"+inputId).val("");
					
					var greeting = {
							speaker: "HAL",
							message: "Hello "+usersName+", if you are ready to begin guessing type ready"
					};
					//greet the user
					publishMessage(greeting);
				}
				else if(aiCommand == "ready" || aiCommand == "restart")
				{
					$("#"+inputId).val("");
										
					var numSecs = 3;
					
					//begin game
					var gameRulesMsg = {
							speaker: "HAL",
							message: "OK "+usersName+", pick a number in your head and I will try to guess it.  I will give you three seconds to come up with a number."
					};
					
					//greet the user
					publishMessage(gameRulesMsg);
					
					readyForUserInput();
					
					//run loading animation
					startLoadingAnimation();
					
					//send off ajax to get first guess
					$.ajax({
						url: "/HAL/computer",
						type: "POST",
						data: {task: "guess", responseToPrevGuess: ""},
						success: function(result){
							
							//stop loading animation
							stopLoadingAnimation();
							
							console.log(result);
							var jsonResult = JSON.parse(result);
							console.log(jsonResult.guess);
							
							firstGuess = jsonResult.guess;
							
							//store guess
							guesses.push(firstGuess);
							
							//adding appropriate commas with jquery
							var formattedGuess = firstGuess.toLocaleString();
							
							//first guess
							var firstGuessMsg = {
									speaker: "HAL",
									message: "Is it "+formattedGuess+" "+usersName+"? Respond with higher, lower or yes"
							};
							//publish first guess
							publishMessage(firstGuessMsg);
						},
						timeout: numSecs * 1000
					});
					

				}
				else if(aiCommand == "higher"  || aiCommand == "lower")
				{
					publishUsersResponse(aiCommand, usersName)
					
					//ready for user input
					readyForUserInput();
					
					//use ajax to send off command :)		
					$.ajax({
						url: "/HAL/computer",
						type: "POST",
						/**dataType: 'text',
						contentType: "application/json",**/
						data: {task: "guess", responseToPrevGuess: aiCommand},
						success: function(result){
							console.log(result);
							var jsonResult = JSON.parse(result);
							console.log(jsonResult.guess);
							
							nextGuess = jsonResult.guess;
							
							publishGuess(nextGuess);
						}
					});
					
					//get next response from ajax
					//var nextGuess = 5;

				}
				else if(aiCommand == "yes")
				{
					//guess was correct terminating guesses
					var taskTerminationMsg = {
							speaker: "HAL",
							message: "Correct answer validated. Program termination sequence initiated. Type restart to begin again."
					}; 
					
					publishMessage(taskTerminationMsg);
					
					//ready for user input
					readyForUserInput();
					
					$.ajax({
						url: "/HAL/computer",
						type: "POST",
						data: {task: "guess", responseToPrevGuess: "correct"},
						success: function(result)
						{
							//game over posted to server
						},
					});
				}
				else
				{
					//print out last user comment
					publishUsersResponse(aiCommand, usersName);
					//alert the user of his/her invalid command HAL-style
					invalidInputResponse(aiCommand, usersName);
				}
			}
		});
	});
	
	function readyForUserInput()
	{
		//clear textbox
		$("#"+inputId).val("");
		
		//set focus to the input
		$("#"+inputId).focus();
				
		//ensure command box stays within view
		$("#messagingContainer").animate({
			scrollTop: $("#"+inputId).position().top + $("#messagingContainer").scrollTop()
		}, "slow");
	}
	
	function invalidInputResponse(command, userName)
	{
		//to test - console.log
		console.log(command);
		
		//store response
		responses.push(command);
		
		//see 2001 a space odyssey for context
		var halRebukeMsg = {
				speaker: "HAL",
				message: "Just what do you think you are doing "+userName+"?  This is not a valid command."
		};
		
		//
		publishMessage(halRebukeMsg);
	}
	
	function publishUsersResponse(command, userName)
	{
		//to test - console.log
		console.log(command);
		
		//store response
		responses.push(command);
		
		//
		var usersResponseMsg = {
				speaker: userName,
				message: command
		};
		
		//
		publishMessage(usersResponseMsg);
		
	}
	
	function publishGuess(guess)
	{
		guesses.push(guess);
		
		//adding appropriate commas with jquery
		var formattedGuess = guess.toLocaleString();
		
		//guess
		var guessMsg = {
				speaker: "HAL",
				message: "Is it "+formattedGuess+" "+usersName+"? Respond with higher, lower or yes"
		};
		//publish next guess
		publishMessage(guessMsg);
		
	}
	
	function publishMessage(messageData)
	{
		var msgTmpl = '<div class="msgFormat">{{speaker}}<p>{{message}}</p></div>';
		
		var renderedMsg = Mustache.to_html(msgTmpl, messageData);
		$(renderedMsg).insertBefore("#"+inputId);
	}
	
	var loadingInterval = null;
	
	function startLoadingAnimation()
	{	
		console.log("starting loading animation");
		loadingInterval = setInterval(function(){
			$("#hal").toggleClass("halSubdued");
		}, 100);
	}
	
	function stopLoadingAnimation()
	{
		console.log("stopping loading animation");
		clearInterval(loadingInterval);
	}
</script>
</head>
<body class="aiBackground">
	<div class="aiContainer">
		<div class="halHeader">
			<div>HAL</div>
			<div>9000</div>
		</div>
		<div id="hal" class="renderHal"></div>
		<div class="halSpeaker"></div>
	</div>
	
	<div id="messagingContainer" class="aiMessagingContainer">
		<input type="text" id="aiCommand" class="aiCommandTextbox" value="" />
	</div>
</body>
</html>