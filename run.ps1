# build container
#    - this should leverage build cache to avoid unnecessary builds
#    - *will* rebuild if alpine docker image gets updated
& $($(Split-Path $MyInvocation.InvocationName) + "\build.ps1")

# run container w/ all files & dirs exposed for use
#    - this exposes the entire project's src dir in the container
#    - the volume local path is dynamic
#    - the volume local path is based on this scripts location so the script can be executed from any cwd
docker run --rm -it `
    -v ${PSscriptRoot}:/opt/document-conversion `
    kmn/document-conversion:latest
