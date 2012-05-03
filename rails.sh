alias sc="rails console"
alias t="touch tmp/restart.txt"
alias r2="sed -i '' 's/adapter: mysql2$/adapter: mysql/g' config/database.yml config/vanity.yml"
alias r3="sed -i '' 's/adapter: mysql$/adapter: mysql2/g' config/database.yml config/vanity.yml"
