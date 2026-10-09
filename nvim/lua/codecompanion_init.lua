require("codecompanion").setup({
  adapters = {
    acp = {
      codex = function()
        return require("codecompanion.adapters").extend("codex", {
          -- defaults = {
          --   auth_method = "openai-api-key",
          -- },
          env = {
            CODEX_API_KEY = vim.env.CODEX_API_KEY,
          },
        })
      end,
    },
  },
  interactions = {
    chat = {
      adapter = {
        name = "codex",
        model = "gpt-5.4",
      },
    },
    cli = {
      agent = "codex",
      agents = {
        claude_code = {
          cmd = "claude",
          args = {},
          description = "Claude Code CLI",
        },
        codex = {
          cmd = "codex",
          args = {},
          description = "OpenAI Codex CLI",
        },
      },
    },
  },
})
