all: README.md

README.md:
	echo "# Bash, Make, Git, and GitHub" > README.md
	echo "" >> README.md    
	echo "Makefile was run at" >> README.md
	ls -l readme.md | cut -d ' ' -f 6-9 >> README.md
	echo "" >> README.md     
	echo "The number of lines of code contained in guessinggame.sh is:" >> README.md  
	wc -l guessinggame.sh | egrep -o "[0-9]"+ >> README.md      
    
clean:
	rm README.md