<#
.SYNOPSIS
This script is as a text-based Magic 8 Ball using the Cmdlet parameter for Get-Random
#>

#Asking the user for a question, any input is fine and will not be used in the program. 
$Question = Read-Host "Ask the Magic 8 Ball a Question?"
Get-Random -InputObject "Yes, in due time.", 
                        "My sources say no.", 
                        "Definitely not.",
                        "Yes.","You will have to wait.",
                        "I have my doubts.",
                        "Outlook so so.",
                        "Looks good to me!",
                        "Who knows?",
                        "Looking good!", 
                        "Probably.", 
                        "Are you kidding?",
                        "Don't bet on it.",
                        "Forget about it.",
                        "Signs point to yes.",
                        "Reply hazy, try again.",
                        "Without a doubt.", 
                        "My sources say no.",
                        "As I see it, yes.",
                        "You may rely on it.", 
                        "Concentrate and ask again.",
                        "Outlook not so good.", 
                        "It is decidedly so.",  
                        "Better not tell you now.",  
                        "Very doubtful.", "Yes - definitely.", 
                        "It is certain.", 
                        "Cannot predict now.", 
                        "Most likely.",  
                        "Ask again later.", 
                        "My reply is no.", 
                        "Outlook good.", 
                        "Don't count on it.", 
                        "Go for it!"