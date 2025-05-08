require("neogit").setup {
  disable_context_highlighting = true,
  process_spinner = true,
  filewatcher = { enabled = false },
  use_magit_keybindings = true,
  disable_commit_confirmation = true,
  integrations = {
    telescope = true,
    diffview = true,
  },
  signs = { section = { "", "" }, item = { "", "" }, hunk = { "", "" } },
  sections = {
    unstaged = {
      folded = false,
      hidden = false,
    },
    untracked = {
      folded = false,
      hidden = false,
    },
    staged = {
      folded = false,
      hidden = false,
    },
    stashes = {
      folded = true,
      hidden = false,
    },
    unpulled = {
      folded = true,
      hidden = true,
    },
    unmerged = {
      folded = true,
      hidden = true,
    },
    recent = {
      folded = true,
      hidden = false,
    },
  },
  mappings = {
    status = {
      ["<c-a>"] = "StageAll",
      ["<c-s>"] = false,
      ["[c"] = "GoToPreviousHunkHeader",
      ["]c"] = "GoToNextHunkHeader",
      ["[s"] = "OpenOrScrollDown",
      ["]s"] = "OpenOrScrollUp",
    },
  },
  auto_refresh = false,
}
