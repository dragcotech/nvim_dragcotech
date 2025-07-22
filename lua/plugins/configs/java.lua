return {
    {
        "g0ne150/java-deps.nvim",
        dependencies = {
            "folke/snacks.nvim",
            {
                "mason-org/mason.nvim",
                opts = { ensure_installed = { "vscode-java-dependency" } },
            },
        },
        config = function()
        end,
    },
}
