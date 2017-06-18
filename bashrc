# include local
if [ -e ~/.bashrc.local ]
then
  source ~/.bashrc.local
fi

# add brew to path
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
