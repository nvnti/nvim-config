local M = {
  imports = {
    granularity = {
      group = "crate",
      enforce = true,
    },
    prefix = "crate",
  },
  cargo = {
    buildScripts = {
      enable = true,
    },
    features = "all",
  },
  procMacro = {
    enable = true,
  },
  rustFmt = {
    extraArgs = "+nightly-2023-11-06",
  },
  server = {
    extraEnv = {
      CARGO_TARGET_DIR = "target-analyzer",
    },
  },
  check = {
    command = "clippy",
    extraArgs = {
      "--",
      "-D",
      "clippy::perf",
      "-D",
      "clippy::needless_lifetimes",
      "-D",
      "warnings",
    },
  },
  checkOnSave = true,
}

return M
