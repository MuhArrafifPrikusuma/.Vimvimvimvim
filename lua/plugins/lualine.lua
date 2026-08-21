return {
    -- 1. Disable the default AstroNvim statusline
    {
        "rebelot/heirline.nvim",
        enabled = false
    },

    -- 2. Configure Lualine correctly
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function ()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = {
                        normal = {
                            a = { fg = "#181926", bg = "#c6a0f6", gui = "bold" },
                            b = { fg = "#c6a0f6", bg = "#1e2030" },
                            c = { fg = "#B4a2F0", bg = "" }
                        },
                        insert = { a = { fg = "#2E3157", bg = "#95C561", gui = "bold" } },
                        visual = { a = { fg = "#2E3157", bg = "#FAB795", gui = "bold" } },
                        replace = { a = { fg = "#2E3157", bg = "#F582A7", gui = "bold" } },
                        command = { a = { fg = "#2E3157", bg = "#f5a97f", gui = "bold" } },
                        inactive = {
                            a = { fg = "#6C6F93", bg = "#2E3157" },
                            b = { fg = "#6C6F93", bg = "#2E3157" },
                            c = { fg = "#6C6F93", bg = "#2E3157" }
                        }
                    },
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {}
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 100, -- Speeds up the redraw cycle slightly
                        tabline = 1000,
                        winbar = 1000,
                        refresh_time = 16,
                        events = {
                            "WinEnter",
                            "BufEnter",
                            "BufWritePost",
                            "SessionLoadPost",
                            "FileChangedShellPost",
                            "VimResized",
                            "Filetype",
                            "ModeChanged",
                            "RecordingEnter",
                            "RecordingLeave",
                            "CmdlineEnter",
                            "CmdlineLeave"
                        }
                    }
                },
                sections = {
                    lualine_a = {
                        "mode",
                        {
                            function ()
                                local reg = vim.fn.reg_recording()
                                if reg == "" then
                                    return ""
                                end
                                return "  @" .. reg
                            end,
                            color = { fg = "#181926", gui = "bold" },
                            cond = function ()
                                return vim.fn.reg_recording() ~= ""
                            end
                        }
                    },
                    lualine_b = {
                        "branch",
                        "diff",
                        "diagnostics"
                    },
                    lualine_c = {
                        {
                            "tabs",
                            tab_max_length = 30,
                            max_length = vim.o.columns / 3,
                            mode = 1,
                            path = 0,
                            use_mode_labels = false,
                            show_modified_status = true,
                            symbols = { modified = "is not saved idiot" }
                        }
                    },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        "filename"
                    },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    }
}
