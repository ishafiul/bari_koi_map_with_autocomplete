SHELL := /bin/bash

### Build Runner
buildRunner:
	fvm flutter pub run build_runner watch --delete-conflicting-outputs

newProjectSetup:
	flutter pub upgrade --major-versions
