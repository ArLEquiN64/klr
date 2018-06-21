__klr::misc::pathshorten()
{
    setopt localoptions noksharrays extendedglob
    local MATCH MBEGIN MEND
    local -a match mbegin mend
    "${2:-echo}" "${1//(#m)[^\/]##\//${MATCH/(#b)([^.])*/$match[1]}/}"
}

__klr::misc::has()
{
    type "${1:?}" &>/dev/null
    return $status
}

