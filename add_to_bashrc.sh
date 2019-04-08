#!/bin/bash

CUR_ABS_PATH=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

echo -e "\n. ${CUR_ABS_PATH}/setup_env.sh \\
\t\tgit \\
\t\tvim \\
\t\tgo \\
\t\t# proxy \\
\t\tdocker \\
\t\tipmitool \\
\t\tipmicore" >> ${HOME}/.bashrc
