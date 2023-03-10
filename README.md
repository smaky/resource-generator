# Resource Generator



## Getting started

This is tuist plugin that is generating access to resources based on swiftgen.yml config file.

## How to use it

Add this in your Config.swift file:

```
cd existing_repo
git remote add origin https://git.corp.xtb.com/mobile/tuist/plugins/resource-generator.git
git branch -M master
git push -uf origin master
```

## Call it from command line
To access this plugin call it from command line in project 

Usage:

```
tuist generate-resources [--config-path <config-path>] [--debug]

```
 
See ```'tuist generate-resources --help'``` for more information.

## Integrate with your Project.swift

There is provided an GenerateResourcesHelper.swift that is looking in folders according to file where it is called the swiftgen.yml files and besed on paths it generating resources.

```
cd existing_repo
git remote add origin https://git.corp.xtb.com/mobile/tuist/plugins/resource-generator.git
git branch -M master
git push -uf origin master
```