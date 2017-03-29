#!/bin/bash

 j=$(for i in `git diff | grep "+++" | awk  '{print $2}'`; do echo ${i#*/}; done); git commit -s $j $@
