install:
	test -d ~/.bme_modules.bkp && rm -rf ~/.bme_modules.bkp  || true
	test -d ~/.bme_modules && mv ~/.bme_modules ~/.bme_modules.bkp || true
	test -d modules && cp -rf modules ~/.bme_modules  || true
	test -d ~/.bme_utilities.bkp && rm -rf ~/.bme_utilities.bkp  || true
	test -d ~/.bme_utilities && mv ~/.bme_utilities ~/.bme_utilities.bkp || true
	test -d utilities && cp -rf utilities ~/.bme_utilities  || true
	test -f ~/.bash_profile.bkp && rm -rf ~/.bash_profile.bkp  || true
	test -f ~/.bash_profile && mv ~/.bash_profile ~/bash_profile.bkp  || true
	cat bash_profile | sed 's:bashrc:~/.bashrc:g;s:login:~/.bme_login:g' > ~/.bash_profile
	test -f ~/.bashrc.bkp && rm -rf ~/.bashrc.bkp  || true
	test -f ~/.bashrc && mv ~/.bashrc ~/bashrc.bkp  || true
	cat bashrc | sed 's:utilities:~/.bme_utilities:g;s:modules:~/.bme_modules:g' > ~/.bashrc


apply: install
	source ~/.bash_profile

clean:
	rm -rf ~/.bme_modules ~/.bme_utilities
