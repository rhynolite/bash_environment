install:
	test -d modules && cp -rf modules ~/.bme_modules 
	test -d utilities && cp -rf utilities ~/.bme_utilities 
	test -f ~/.bash_profile && cp ~/.bash_profile ~/bash_profile.bkp 
	cat bash_profile | sed 's:utilities:~/.bme_utilities:g;s:login:~/.bme_login:g' > ~/.bash_profile
	cat bashrc | sed 's:utilities:~/.bme_utilities:g;s:modules:~/.bme_modules:g' > ~/.bashrc


apply: install
	source ~/.bash_profile
