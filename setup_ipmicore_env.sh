#!/bin/bash

#
# Setup ipmicore development env
#

# Set ipmi toolchain PATH environment parameters
export PATH="${PATH}:${HOME}/ipmi_core_linux/repo_compiler/frucompiler/trunk/frucompiler/"
export PATH="${PATH}:${HOME}/ipmi_core_linux/repo_compiler/hpm1builder/trunk/"
export PATH="${PATH}:${HOME}/ipmi_core_linux/tool_chain/m68k-uclinux/bin/"
export PATH="${PATH}:${HOME}/ipmi_core_linux/tool_chain/arm-none-eabi/bin/"
export PATH="${PATH}:${HOME}/ipmi_core_linux/tool_chain/arm-unknown-linux-uclibgnueabi_4.9.3/bin/"

# Set docker build shotcut
if type docker > /dev/null 2>&1
then
	docimg="ipmi_build"
	doctag="4.1"
	alias docmake='time docker run \
			--rm \
			-v ${HOME}/ipmi_core_linux:/home/user/ipmi_core_linux \
			--workdir ${PWD/${USER}/user/} \
			--user $(id -u):$(id -g) \
			--name make-${USER} \
			${docimg}:${doctag} \
			make'
	alias docbash='docker run \
			-it \
			--rm \
			-v ${HOME}/ipmi_core_linux:/home/user/ipmi_core_linux \
			--workdir /home/user \
			--name bash-${USER} \
			${docimg}:${doctag} \
			bash'
fi
