require("nvim-tree").setup(
    {
        view = {
            centralize_selection = true,
            width = 50,
            float = {
                enable = false,
            },
            mappings = {
                custom_only = false,
                list = {

                }
            }
        },
        diagnostics = {
            enable = true,
        }
    }
);
