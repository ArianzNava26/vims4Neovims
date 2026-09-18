echo ""
echo "Welcome to My Lovely Bash.. ~Navaz"
echo ""
echo "Let's try to modify Your Neovim!"
echo ""
PLUGINS=$(find ~/.config/nvim -type d -iname "plugins")
if [ -z $PLUGINS ]; then
  echo "Plugins Folder not Found! Check Your Neovim Installation!"
  exit 1
fi
echo "Your Neovim's Plugin's Folder is Here : $PLUGINS"
echo ""
echo "So,Now we can put the LUA's Magic Files into $PLUGINS"
echo ""
echo "First we create it FIRST!"
echo ""
touch blink.lua || echo "Blink.lua Failed.."
touch autopairs.lua || echo "Autopairs.lua failed"
touch diagnostics.lua || echo "Creating diagnostics.lua failed"
echo "All Lua's Files Created! YEAAAYYY!!"
cat <<'NAVA' >blink.lua
return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      -- Mematikan popup saran agar tidak muncul otomatis saat mengetik
      menu = {
        auto_show = false,
      },
      -- Mematikan teks bayangan (ghost text) dari Copilot/AI yang mengganggu
      ghost_text = {
        enabled = false,
      },
    },
  },
}
NAVA
echo "Coding blink SUCCESS!"

cat <<'NAVA' >autopairs.lua
return {
  { "echasnovski/mini.pairs", enabled = false },
} 
NAVA
echo "Coding Autopairs SUCCESS!"

cat <<'NAVA' >diagnostics.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        -- Mematikan teks error panjang di sebelah baris kode
        virtual_text = false, 
        -- Tetap mempertahankan ikon penanda di pinggir kiri layar
        signs = true,
        -- Tetap memberikan garis bawah merah pada kata yang salah
        underline = true,
      },
    },
  }
}
NAVA
echo "Coding diagnostics.lua Done!"
echo ""
echo "Let move them into $PLUGINS"
echo ""
mv diagnostics.lua autopairs.lua blink.lua $PLUGINS || echo "Failed Moving"
echo "ALL DONE!!"
