@echo off
wasm -mf d.asm
wcc386 -hc -d3 -3s -mf i.c
wlink FILE i.obj,d.obj NAME i.exe DEBUG CODEVIEW OPTION CVPACK


rem /"DEBUG CODEVIEW OPTION CVPACK"
