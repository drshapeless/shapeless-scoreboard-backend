.PHONY: test build run clean migration install/init uninstall remove-db reset-db

test :
	./bin/scoreboard

build :
	go build -o=./bin/scoreboard ./cmd/scoreboard

run :
	go run ./cmd/scoreboard

clean:
	rm ./bin/scoreboard

install : ./bin/scoreboard
	cp ./bin/scoreboard /usr/local/bin/scoreboard

migration :
	sh ./scripts/migrations.sh

install/init : ./init/scoreboard.init
	cp ./init/scoreboard.init /etc/init.d/scoreboard
	chmod +x /etc/init.d/scoreboard

uninstall :
	rm /usr/local/bin/scoreboard
	rm ~/scoreboard.db

remove-db :
	rm ~/scoreboard.db

reset-db : remove-db migration
