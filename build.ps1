$orig_dir = $(Get-Location)
cd $PSscriptRoot
docker build --pull -t kmn/document-conversion:latest .
cd $orig_dir
