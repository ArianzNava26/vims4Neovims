echo ""
echo "Welcome to My Lovely Bash.. ~Navaz"
echo ""
echo "Let's try to modify Your Neovim!"
echo ""
PLUGINS=$(find ~/.config -type d -iname "plugins")
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
echo "return {
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
}" >blink.lua || echo "Coding Blink Failed"
echo "Coding blink SUCCESS!"
echo "return {
  { "echasnovski/mini.pairs", enabled = false },
}" >autopairs.lua || echo "Coding Autopairs failed"
echo "Coding Autopairs SUCCESS!"
echo "return {
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
}" >diagnostics.lua || echo "Coding diagnostics.lua FAILED"
echo "Coding diagnostics.lua Done!"
echo ""
echo "Let move them into $PLUGINS"
echo ""
sudo mv diagnostics.lua autopairs.lua blink.lua $PLUGINS || echo "Failed Moving"
echo "ALL DONE!!"
