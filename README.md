# Docker image for Flutter Android builds on Azure Pipelines

<p align="center">
  <img src="https://raw.githubusercontent.com/messeb/docker-image-flutter-azure-pipelines/master/images/docker-image-android-flutter-for-azure-pipelines.png">
</p>

Installs latest stable Flutter version with Flutter Version Manager ([https://github.com/leoafarias/fvm](https://github.com/leoafarias/fvm)) on top of the Android image of [inovex GmbH](https://www.inovex.de/de/leistungen/apps/) ([https://github.com/inovex/gitlab-ci-android](https://github.com/inovex/gitlab-ci-android)).


It handles the issue that Azure Pipelines creates an own user inside the container, and needs root rights for it:

* [Can't acquire root on common container distros](https://github.com/Microsoft/azure-pipelines-agent/issues/2043)
*  [Azure DevOps pipeline limitations when using SDK images](https://github.com/dotnet/dotnet-docker/issues/788)

Solution:

* Pre-adds the Azure Pipeline user `vsts_azpcontainer`
* Sets the user back to `root`, that Azure Pipelines pre-build scripts work

## Example usage

_azure-pipelines.yml_:

```
pool:
  vmImage: 'ubuntu-16.04'

container: messeb/docker-image-flutter-azure-pipelines:latest

steps:  
- script: |
    flutter build apk --release
  displayName: 'Flutter Android build'
```