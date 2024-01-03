local ls = require("luasnip")

local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node

ls.filetype_extend("vue", { "typescript", "javascript" })

ls.add_snippets("vue", {
  -- Function declaration
  s(
    "f",
    fmt(
      [[
const {} = ({}) => {{
  {}
}};
]],
      { i(1), i(2), i(3) }
    )
  ),

  -- Vue component
  s(
    "comp",
    fmt(
      [[
<script setup lang="ts" >
{}
</script>

<template>
  <div></div>
</template>
]],
      { i(1) }
    )
  ),
})
