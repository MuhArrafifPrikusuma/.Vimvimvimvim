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
                            a = { fg = "#181926", bg = "#ea999c", gui = "bold" },
                            b = { fg = "#ea999c", bg = "#1e2030", gui = "bold" },
                            c = { fg = "#B4a2F0", bg = "none" }
                        },
                        insert = {
                            a = { fg = "#181926", bg = "#d3c890", gui = "bold" },
                            b = {
                                fg = "#d3c890",
                                bg = "#11111b",
                                gui = "bold"
                            },
                            c = { fg = "#a6e3a1", bg = "none" }
                        },
                        visual = {
                            a = { fg = "#181926", bg = "#91d7e3", gui = "bold" },
                            b = {
                                fg = "#91d7e3",
                                bg = "#181825",
                                gui = "bold"
                            },
                            c = { fg = "#cdd6f4", bg = "none" }
                        },
                        replace = {
                            a = { fg = "#181926", bg = "#F582A7", gui = "bold" },
                            b = {
                                fg = "#F582A7",
                                bg = "#1e2030",
                                gui = "bold"
                            }
                        },
                        command = {
                            a = { fg = "#181926", bg = "#ffa97f", gui = "bold" },
                            b = {
                                fg = "#ffa97f",
                                bg = "#1e2030",
                                gui = "bold"
                            },
                            c = { fg = "#89b4fa", bg = "none" }
                        },
                        terminal = {
                            a = { fg = "#181926", bg = "#f2d5cf", gui = "bold" },
                            b = {
                                fg = "#f2d5cf",
                                bg = "#1e2030",
                                gui = "bold"
                            },
                            c = { fg = "#f2cdcd", bg = "none" }
                        },
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
                        },
                        "selectioncount",
                        "searchcount"
                    },
                    lualine_b = {
                        "branch",
                        "diff",
                        "diagnostics",
                        "hostname"
                    },
                    lualine_c = {
                        {
                            "tabs",
                            tab_max_length = 30,
                            max_length = vim.o.columns / 3,
                            mode = 1,
                            path = 0,
                            use_mode_labels = true,
                            show_modified_status = true,
                            symbols = { modified = "۞" }
                        }
                    },

                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress", "lsp_status" },
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
