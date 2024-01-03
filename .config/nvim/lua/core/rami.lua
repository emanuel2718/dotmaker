LAZY_PLUGINS = {}

function plug(item)
  table.insert(LAZY_PLUGINS, { import = item })
end