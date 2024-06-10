$ScriptDir = Split-Path $MyInvocation.MyCommand.Path

# env読み込み
Get-Content "${ScriptDir}/../.env" | Select-String -Pattern "^[^#]" | %{ Set-Variable $_.toString().split("=")[0] $_.toString().split("=")[1] }

# 30個パイプラインを作る
1..30 | ForEach-Object {
    "http://localhost:5601/api/logstash/pipeline/test{0:00}" -f $_
} | ForEach-Object {
    Invoke-WebRequest -Uri $_ `
        -Method PUT`
        -Headers @{
            "kbn-xsrf" = true;
            Authorization = "Basic "+ [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("elastic:${ELASTIC_PASSWORD}"))
        } `
        -InFile "${ScriptDir}/../test-pipline.json"
}