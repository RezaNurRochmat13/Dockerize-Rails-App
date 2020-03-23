#! bin/bash

echo "Executed Entrypoint"

cd /usr/src/app/

ls -l

rails db:seed
rails db:migrate

rails s -e production -b 0.0.0.0
