$canvasDomain = "https://canvas.instructure.com/api/v1/"
$accessToken = ""
$headers = @{"Authorization"="Bearer "+$accessToken} # build access token header

$canvasCourseUrl = 2102022

# get course data
$canvasCourseUrl =  "$canvasDomain/courses/$canvasCourseUrl"
$canvasCourseResult = Invoke-RestMethod -Method GET -uri $canvasCourseUrl -header $headers  

Write-Host $canvasCourseResult

# update course grading scheme
$updateCourseJson = @{"course[grading_standard_id]"=129230;}    
$updateCourseUrl = "$canvasDomain/courses/$canvasCourseUrl"
$updateCourseResults = Invoke-RestMethod -Method put -uri $updateCourseUrl -header $headers -body $updateCourseJson  -contentType "application/x-www-form-urlencoded"

# get course data
$canvasCourseUrl =  "$canvasDomain/courses/$canvasCourseUrl"
$canvasCourseResult = Invoke-RestMethod -Method GET -uri $canvasCourseUrl -header $headers  

Write-Host $canvasCourseResult
