return {
  "derektata/lorem.nvim",
  -- Automatically lazy-loads when you use the commands or keymaps
  cmd = "LoremIpsum",
  keys = {
    { "<leader>rp", "<cmd>setlocal textwidth=80<cr><cmd>LoremIpsum paragraphs 1<cr>", desc = "Insert Lorem Paragraphs" },
    { "<leader>rs", "<cmd>LoremIpsum sentences 10<cr>", desc = "Insert 10 Lorem Sentences" },
    { "<leader>rl", "<cmd>LoremIpsum words 20<cr>", desc = "Insert 20 Lorem Words" },
    { "<leader>rr", "<cmd>setlocal textwidth=80<cr><cmd>LoremIpsum paragraphs 10<cr>", desc = "Insert 20 Lorem Paragraphs"},
  },
  -- Automatically calls require("lorem").setup(opts) for you
  opts = {
    sentence_length = "mixed",
    comma_chance = 0.3,
    max_commas = 2,
  },
}


