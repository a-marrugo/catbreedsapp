## ----------------------------------------------------
## Clean project
## ----------------------------------------------------

cleanAndroid: # Clean Android files to run app on simulator
	rm -rf android/app/build
	flutter pub cache repair
	flutter clean

cleanIOS: # Clean IOS files to run app on simulator
	@bash -c 'echo ;\
	echo rm -rf ios/Pods/ ;\
	rm -rf ios/Pods/ ;\
	echo rm -rf ios/Podfile.lock ;\
	rm -rf ios/Podfile.lock ;\
	echo flutter pub get ;\
	flutter pub get ;\
	echo cd ios/ ;\
	cd ios/ ;\
	echo pod install ;\
	pod install ;\
	echo cd .. ;\
	cd .. ;\
	'