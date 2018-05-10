#!/bin/bash


alias antlr4='java -jar $ANTLR_HOME'

java org.antlr.v4.Tool newPascal.g4

javac newPascal*.java

java org.antlr.v4.gui.TestRig newPascal program sample.txt -gui
