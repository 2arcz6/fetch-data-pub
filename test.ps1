$URL = "https://api.github.com"
$Endpoint = "/gists"


$password = Get-Content C:\Users\ASUS\Desktop\pass.txt

$URLAnon = "$URL$Endpoint"


$JSON = ConvertTo-Json @{
          description = "the descriptiodsadasdn for this gist";
          public =  $true;
          files = @{
            "file1.txt" = @{
              content = "String file condasdasdastents"
            }
          }
        }


$gist = Invoke-RestMethod -Method Post -Uri $URLAnon -Body $JSON

$Token = "?access_token=e50f49b324409425846fcd256aef4b34863c3812"
$URLSecure = "$URL$Endpoint$Token"

$gist = Invoke-RestMethod -Method Post -Uri $URLSecure -Body $JSON

$URLEdit = "$URL$Endpoint/$($gist.id)$Token"

$JSON2 = ConvertTo-Json @{
          description = "Potadasdasto";
          public =  $true;
          files = @{
            "file1.txt" = @{
              content = $password
            }
          }
        }

$gist = Invoke-RestMethod -Method Post -Uri $URLEdit -Body $JSON2