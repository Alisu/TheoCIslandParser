# TheoCIslandParser
An island C parser for the refactoring of plugins of the pharo-vm.
I have to unify both grammar and change the names of rules (i lost some AST nodes because of that).

Started from 
```smalltalk
Metacello new
    baseline: 'ParserTutorial';
    repository: 'github://Larcheveque/ParserTutorial';
    onWarningLog;
load.
```
