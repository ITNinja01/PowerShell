function Test-API {
  param (
    [Parameter(Mandatory)]
    [string]$APIURI
  )
    
  $Articles = Invoke-RestMethod -Uri $APIURI
  $Count = $Articles.Length

  return $Count
}
