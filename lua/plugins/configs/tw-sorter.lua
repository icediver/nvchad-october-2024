local M = {}

M.on_save_enabled = true -- If `true`, automatically enables on save sorting.
M.on_save_pattern = { "*.html", "*.js", "*.jsx", "*.tsx", "*.twig", "*.hbs", "*.php", "*.heex", "*.astro" } -- The file patterns to watch and sort.
M.node_path = "node"
M.trim_spaces = false -- If `true`, trim any extra spaces after sorting.

return M
