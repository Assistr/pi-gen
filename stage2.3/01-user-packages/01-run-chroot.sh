# Change default shell for pi to zsh
chsh -s /usr/bin/zsh pi

# Login as pi
su - pi

# Install oh-my-zsh and add spaceship theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source ~/.zshrc
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i.bkp1 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' ~/.zshrc

# ZSH preferences
# Enable ZSH plugins
sed -i.bkp2 '/source $ZSH\/oh-my-zsh.sh/iplugins=(git docker docker-compose)' ~/.zshrc
cat <<EOT >> ~/.zshrc
# Spaceship config
SPACESHIP_TIME_SHOW="true"
SPACESHIP_DIR_SHOW=true

# Enable aws completion
source \$(which aws_zsh_completer.sh)

# Aliases
alias ecr-docker-login='eval \$(aws ecr get-login --no-include-email)'

# AWS
export AWS_ACCESS_KEY_ID=AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=AWS_DEFAULT_REGION
export AWS_DEFAULT_OUTPUT=json
export AWS_ECR_HOST=AWS_ECR_HOST

# Panni API
export API_AUTH_TOKEN="API_AUTH_TOKEN"
EOT

# Vim preferences
cat <<EOT >> ~/.vimrc
syntax on
set paste
set mouse=a
EOT
