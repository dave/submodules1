init:
	rm -rf .git
	rm -rf foo
	rm README.md
	echo "# submodules1 master" > README.md
	git init # reinitialise git and nuke everything
	git add .
	git commit -m "Initial commit"
	git remote add origin https://github.com/dave/submodules1.git
	git push --set-upstream --force origin master
	git submodule add https://github.com/dave/submodules2 foo
	git submodule set-branch --branch master foo # remember this is the path relative to the .git home dir (not to the current dir)
	git submodule update --init --recursive foo

update:
	git submodule update --recursive --remote foo
