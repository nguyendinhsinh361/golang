postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=123456 -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root shin

dropdb:
	docker exec -it postgres12 dropdb shin

migrateup:
	migrate -path db/migration -database "postgresql://root:123456@localhost:5432/shin?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://root:123456@localhost:5432/shin?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://root:123456@localhost:5432/shin?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://root:123456@localhost:5432/shin?sslmode=disable" -verbose down 1

sqlc: 
	docker run --name sqlc --rm -v "C:/Users/Sinhthuatthom/Desktop/Golang:/src" -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/techschool/simplebank/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migrateup1 migratedown migratedown1 sqlc test server mock