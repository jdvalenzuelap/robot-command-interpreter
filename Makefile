all:
	lex robot.l
	yacc -d robot.y
	gcc -o robot lex.yy.c y.tab.c -ll -ly

clean:
	rm -rf robot
	rm -rf lex.yy.c
	rm -rf y.tab.c
	rm -rf y.tab.h
	rm -rf y.tab.h.gch