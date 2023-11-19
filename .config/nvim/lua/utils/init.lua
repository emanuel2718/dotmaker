local M = {}

function M.map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == "string" then
    modes = { modes }
  end
  for _, mode in ipairs(modes) do
    if type(rhs) == "string" then
      vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    else
      opts.callback = rhs
      vim.api.nvim_set_keymap(mode, lhs, "", opts)
    end
  end
end

local to_ensured_packages = {}

---Structure to handle the installation of mason packages
M.ensure_package_installed = {
  ---Add a package to be installed later
  ---@param package_identifier string[]
  add = function(package_identifier)
    vim.tbl_map(function(p)
      if vim.tbl_contains(to_ensured_packages, p) then
        return
      end

      table.insert(to_ensured_packages, p)
    end, package_identifier)
  end,

  ---Execute the installation of all given packages once (in lsp config)
  execute = function()
    local function deferred_function()
      if #to_ensured_packages == 0 then
        vim.notify("No packages were provided to be installed - maybe the loading-order is wrong?")
        return
      end

      local registry = require("mason-registry")
      local lspconfig = require("mason-lspconfig")

      for _, package_identifier in ipairs(to_ensured_packages) do
        package_identifier = lspconfig.get_mappings().lspconfig_to_mason[package_identifier] or package_identifier

        local ok, pkg = pcall(registry.get_package, package_identifier)
        if ok then
          if not pkg:is_installed() then
            registry.refresh(function()
              vim.notify("Installing " .. package_identifier)
              pkg:install()
            end)
          end
        else
          vim.notify("Package " .. package_identifier .. " not found")
        end
      end
    end

    -- sometimes the registry is not yet loaded, so we defer the function
    -- not entirely sure why this works, but it is being done by other repos as well
    vim.defer_fn(deferred_function, 0)
  end,
}

M.augroup = function(name, options)
  return vim.api.nvim_create_augroup("rami_augroup_" .. name, options or {})
end

M.mergeTable = function(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

return M
