install:
	test -d modules && cp -rf modules ~/.bme_modules 
	test -d utilities && cp -rf utilities ~/.bme_utilities 
	test -f ~/.bash_profile && cp ~/.bash_profile ~/bash_profile.bkp 
	cp -rf bash_profile ~/.bash_profile  


apply: install
	source ~/.bash_profile
