#!/bin/sh
export KAZOO_CONFIG=/home/user/config.ini

. erlang/activate

RELEASE_ROOT_DIR=/home/user/kazoo/_rel/kazoo
REL_NAME="kazoo"
REL_VSN="4.0.0"
ERTS_VSN="7.3"
CODE_LOADING_MODE="${CODE_LOADING_MODE:-embedded}"
REL_DIR="$RELEASE_ROOT_DIR/releases/$REL_VSN"
ERL_OPTS=""
RUNNER_LOG_DIR="${RUNNER_LOG_DIR:-$RELEASE_ROOT_DIR/log}"

find_erts_dir() {
    __erts_dir="$RELEASE_ROOT_DIR/erts-$ERTS_VSN"
    if [ -d "$__erts_dir" ]; then
        ERTS_DIR="$__erts_dir";
        ROOTDIR="$RELEASE_ROOT_DIR"
    else
        __erl="$(which erl)"
        code="io:format(\"~s\", [code:root_dir()]), halt()."
        __erl_root="$("$__erl" -noshell -eval "$code")"
        ERTS_DIR="$__erl_root/erts-$ERTS_VSN"
        ROOTDIR="$__erl_root"
    fi
}

find_erts_dir

export ROOTDIR="$RELEASE_ROOT_DIR"
export BINDIR="$ERTS_DIR/bin"
export EMU="beam"
export PROGNAME="erl"
export LD_LIBRARY_PATH="$ERTS_DIR/lib:$LD_LIBRARY_PATH"

ERTS_LIB_DIR="$ERTS_DIR/../lib"

cd "$ROOTDIR"

exec /home/user/kazoo/_rel/kazoo/erts-7.3/bin/erlexec -boot /home/user/kazoo/_rel/kazoo/releases/4.0.0/kazoo -mode embedded -boot_var ERTS_LIB_DIR /home/user/kazoo/_rel/kazoo/erts-7.3/../lib -config /home/user/kazoo/_rel/kazoo/releases/4.0.0/sys.config -args_file /home/user/kazoo/_rel/kazoo/releases/4.0.0/vm.args -- console
