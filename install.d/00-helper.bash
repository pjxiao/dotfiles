force_put()
{
    local dest=${1}
    local tmpfile=$(mktemp)
    chmod 600 ${tmpfile}
    cat > ${tmpfile}
    mv -vf ${tmpfile} ${dest}
}


append_marker_leaded_lines()
{
    local marker=${1}
    local dest=${2}
    grep -q "${marker}" "${dest}" || \
        (echo -e "\n${marker}" >> ${dest} && cat >> ${dest})
}
