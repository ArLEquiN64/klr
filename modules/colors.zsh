autoload -U colors && colors

typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

if [[ "$(tput colors)" == "256" ]]; then
    # change default colors
    #fg[red]=$FG[160]
    #fg[green]=$FG[064]
    #fg[yellow]=$FG[136]
    #fg[blue]=$FG[033]
    #fg[magenta]=$FG[125]
    #fg[cyan]=$FG[037]

    fg[teal]=$FG[041]
    fg[orange]=$FG[166]
    fg[violet]=$FG[061]
    fg[neon]=$FG[112]
    fg[pink]=$FG[183]
else
    fg[teal]=$fg[blue]
    fg[orange]=$fg[yellow]
    fg[violet]=$fg[magenta]
    fg[neon]=$fg[green]
    fg[pink]=$fg[magenta]
fi

ON_COLOR="%{$fg[green]%}"
OFF_COLOR="%{$reset_color%}"
ERR_COLOR="%{$fg[red]%}"

