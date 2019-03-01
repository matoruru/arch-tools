echo "[Install fish theme:]"

# check whether fish and its config dir exist or not
if [[ ! -f /bin/fish ]]; then
   echo fish does not exist!
   exit
fi
if [[ ! -d ~/.config/fish ]]; then
   echo ~/.config/fish does not exist!
   exit
fi

if [[ ! -d ~/repositories ]]; then
   echo ~/repositories dir does not exist!
   exit
fi
echo fish and its config dir exist!
echo continue installing fisherman...

echo "   [Install fisherman:]"
if [[ -f ~/.config/fish/functions/fisher.fish ]]; then
   echo fisher.fish is installed already!
else
   curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fi

echo "   [Install yimmy theme:]"
if [[ -d ~/repositories/theme-yimmy ]]; then
   echo timmy is installed already!
   exit
fi
cd ~/repositories
git clone https://github.com/oh-my-fish/theme-yimmy.git
