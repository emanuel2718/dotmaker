LAZY_PLUGINS = {}

function PLUG(item)
  table.insert(LAZY_PLUGINS, { import = 'plugins.' .. item })
end
