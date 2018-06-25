#!/bin/bash


alias antlr4='java -jar $ANTLR_HOME'

java org.antlr.v4.Tool Grammar.g4

javac Grammar*.java

java org.antlr.v4.gui.TestRig Grammar program sample.txt -gui
