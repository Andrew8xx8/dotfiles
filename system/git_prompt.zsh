if [[ -x `which git` ]]; then
    function git-branch-name () {
        git branch 2> /dev/null | grep '^\*' | sed 's/^\*\ //'
    }

    function git-prompt() {
        branch=$(git-branch-name)
        if [[ x$branch != x ]]; then
          echo "[%{$fg[cyan]%}$branch%{$reset_color%}%{$fg[blue]%}]"
        fi
    }

    function git-scoreboard () {
        git log | grep Author | sort | uniq -ci | sort -r
    }

    function git-track () {
        branch=$(git-branch-name)
        git config branch.$branch.remote origin
        git config branch.$branch.merge refs/heads/$branch
        echo "tracking origin/$tracking"
    }

    function github-init () {
        git config branch.$(git-branch-name).remote origin
        git config branch.$(git-branch-name).merge refs/heads/$(git-branch-name)
    }
fi

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}
