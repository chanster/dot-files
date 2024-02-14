local plug_path = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"
if not vim.loop.fs_stat(plug_path) then
    vim.fn.system({
    	"curl", "--create-dirs",
    	"-sfL", "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
    	"-o", plug_path
    })
end

vim.opt.rtp:prepend(plug_path)

