require'marks'.setup {
  default_mappings = true,
  cyclic = true,
  force_write_shada = false,
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  excluded_filetypes = {},
}
