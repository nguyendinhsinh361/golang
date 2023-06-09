package main

import (
	"database/sql"
	"log"

	"github.com/techschool/simplebank/api"
	"github.com/techschool/simplebank/db/sqlc"
	"github.com/techschool/simplebank/util"
)

func main() {
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("Cannot load config:", err)
	}
	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("Cannot connect to db: ", err)
	}

	store := sqlc.NewStore(conn)
	server,err := api.NewServer(config,store)

	if err != nil {
		log.Fatal("cannot create server:", err )
	}

	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("Cannot start server:", err)
	}
}