#!/bin/sh
MARCO_HISTORY="$HOME/.marco_history"
#标记当前目录
marco() {
    echo "$(pwd)" > "$MARCO_HISTORY"
    echo "Marco: 已记录当前的目录$(pwd)"
}
#返回标记的目录
polo() {
    if [ -f "$MARCO_HISTORY" ]; then
        cd "$(cat "$MARCO_HISTORY")"  # 读取文件中的路径并跳转
        echo "Polo: 已跳转至标记目录 → $(pwd)"
    else
        echo "错误：未找到标记记录！请先运行 'marco'"
    fi
}