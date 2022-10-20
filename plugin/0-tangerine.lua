local function bootstrap(plugin)
    local _, _, plugin_name = string.find(plugin, [[%S+/(%S+)]])
    local plugin_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/" .. plugin_name
    if vim.fn.empty(vim.fn.glob(plugin_path)) ~= 0 then
        print(plugin_name .. ": installing in data dir...")

        vim.fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/" .. plugin,
            plugin_path,
        })

	vim.cmd [[redraw]]
	print(plugin_name .. ": installed")
    end
end

bootstrap("folke/which-key.nvim")
bootstrap("wbthomason/packer.nvim")
bootstrap("lewis6991/impatient.nvim")
bootstrap("udayvir-singh/tangerine.nvim")
bootstrap("udayvir-singh/hibiscus.nvim")
bootstrap("rebelot/kanagawa.nvim")

_G.__luacache_config = {
    chunks = {
        enable = true,
        path = vim.fn.stdpath('cache') .. 'luacache_chunks',
    },
    modpaths = {
        enable = true,
        path = vim.fn.stdpath('cache') .. 'luacache_modpaths',
    }
}

require [[impatient]]
require [[tangerine]].setup {
    compiler = {
	hooks = {"oninit"}
    }
}
