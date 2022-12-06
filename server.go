package main

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		fmt.Println("GET Method /")
		return c.String(http.StatusOK, "Hello, World")
	})
	e.Logger.Fatal(e.Start(":1323"))
}
