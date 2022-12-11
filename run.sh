#!/bin/sh
test -z "${1}" && TAG=latest || TAG=${1}
test -z "$(echo ${*}|grep keep)" && test -d emacs.d-test && sudo rm -rf emacs.d-test
cp -a emacs.d emacs.d-test

EMACS_D="-v ${PWD}/emacs.d-test:/root/.emacs.d"
TESTC_D="-v ${PWD}/test-code:/test-code"
RUNTM_D="-v ${HOME}/.runtimes:/root/.runtimes"

sudo docker run --rm -it ${EMACS_D} ${TESTC_D} ${RUNTM_D} macs:${TAG}
