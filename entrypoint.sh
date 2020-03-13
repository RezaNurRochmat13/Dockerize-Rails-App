#! bin/bash

echo "Executed Entrypoint"

cd /usr/src/app/

ls -l

rails db:migrate

rails s -b 0.0.0.0