vim.filetype.add({
    extension = {
        xaml = "xml",

        h = function(path, bufnr)
            if vim.fn.search("\\C^#include <[^>.]\\+>$", "nw") ~= 0 then
                return "cpp"
            end
            return "c"
        end,
    },
    filename = {
        [".clangd"] = "yaml",
        [".clang-format"] = "yaml",
    },
})
