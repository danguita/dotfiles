css =
"""
td > div, div.Bk, body.editable, textarea {
  font-family: Menlo, Monaco, DejaVu Sans Mono, Courier, monospace !important;
}
"""

try
  # Prepare style tag
  node = document.createElement "style"
  node.type = "text/css"
  node.appendChild document.createTextNode css

  # Append to all heads
  heads = document.getElementsByTagName 'head'

  head.appendChild(node) for head in heads

catch err
  try
    console.log "Error applying GMail style: "
    console.log err
    console.log err.stack
  catch err
    # pass
