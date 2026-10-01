set fish_greeting

if status is-interactive
# Commands to run in interactive sessions can go here
end

# Uses eza instead of ls
alias ls='eza'
alias ll='ls -l'
alias la='ls -a'
alias cl='clear'

alias grep='grep --color=auto'

# Adds !! and !$
abbr -a !! --position anywhere --function last_history_item
function last_history_item; echo $history[1]; end


# Backup files
function backup --argument file; cp $file $file.bak; end 

# Adds ^old^new
abbr histreplace --regex '\^.*\^.*' --function replace_history --position anywhere
function replace_history
	set -l kv (string split '^' -- $argv[1])
	string replace -- $kv[2] $kv[3] $history[1]
end

thefuck --alias | source
