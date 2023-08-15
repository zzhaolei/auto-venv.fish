function __auto_activate_venv --on-variable PWD --description "Automatically activate python .venv"
    status --is-command-substitution; and return

    # find venv in the directory
    set -l venv_dir
    for _dir in venv .venv
        if test -e "$_dir/bin/activate.fish"
            set venv_dir $_dir
            break
        end
    end

    # if not found venv will be return
    if test -z "$venv_dir"
        return
    end

    if test -n "$VIRTUAL_ENV"
        # if activate venv equals current venv will be return
        if test "$VIRTUAL_ENV" = "$PWD/$venv_dir"
            return
        end
        # if activate venv not equals current venv will be deactivate current venv
        deactivate
    end
    # activate venv
    source $venv_dir/bin/activate.fish
end
