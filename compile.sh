#!/bin/bash

# Функция вывода справки
usage() {
    echo "Usage: $0 [options] file.cpp"
    echo "Options:"
    echo "  -h, --help    Show this help"
    echo "  -o <file>     Specify output name (default: basename of input file without extension)"
    echo "  -c <compiler> Specify compiler (clang++ or g++, default: clang++)"
    exit 1
}

# Значения по умолчанию
COMPILER="clang++"
OUTPUT=""
INPUT=""

# Разбор аргументов
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            usage
            ;;
        -o)
            OUTPUT="$2"
            shift 2
            ;;
        -c)
            COMPILER="$2"
            shift 2
            ;;
        *)
            if [[ -z "$INPUT" ]]; then
                INPUT="$1"
                shift
            else
                echo "Error: Too many arguments"
                usage
            fi
            ;;
    esac
done

# Проверка наличия входного файла
if [[ -z "$INPUT" ]]; then
    echo "Error: No input file specified"
    usage
fi

if [[ ! -f "$INPUT" ]]; then
    echo "Error: File '$INPUT' not found"
    exit 1
fi

# Определяем имя выходного файла
if [[ -z "$OUTPUT" ]]; then
    OUTPUT=$(basename "$INPUT" .cpp)
fi

# Компиляция
echo "Compiling $INPUT with $COMPILER -std=c++26..."
$COMPILER -std=c++2c "$INPUT" -o "$OUTPUT"

if [[ $? -eq 0 ]]; then
    echo "Compilation successful. Output: ./$OUTPUT"
    read -p "Run the program? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        ./"$OUTPUT"
    fi
else
    echo "Compilation failed"
    exit 1
fi
