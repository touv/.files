# {{{ SSH-AGENT for Cygwin 
export SSH_AUTH_SOCK=/tmp/.ssh-socket

ssh-add -l 2>&1 >/dev/null
if [ $? = 2 ]; then
	# On nettoie ...
	pid=`cat /tmp/.ssh-agent-pid`
	kill $pid 2>&1 >/dev/null
	/bin/rm  $SSH_AUTH_SOCK 2>&1 >/dev/null
	/bin/rm /tmp/.ssh-script 2>&1 >/dev/null

	# Exit status 2 means couldn't connect to ssh-agent; start one now
	ssh-agent -a $SSH_AUTH_SOCK >/tmp/.ssh-script
	. /tmp/.ssh-script
	echo $SSH_AGENT_PID >/tmp/.ssh-agent-pid
	ssh-add
fi

function kill-agent {
	pid=`cat /tmp/.ssh-agent-pid`
	kill $pid
}
# }}}

