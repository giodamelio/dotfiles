{
  "items": [inputs |
            select(.type == "match") |
            {
              title: .data.lines.text,
              subtitle: ("file: " + (.data.path.text | split("/") | last ) + " line: " + (.data.line_number|tostring)),
              arg: .data.path.text,
              type: "file",
              variables: {
                match: .data.submatches[0].match.text,
                # Find the byte offset of the first match to feed to vim
                num: ([.data.absolute_offset, .data.submatches[0].start, 1] | add)
              }
            }
           ]
}
