package main

import (
	"encoding/xml"

	"github.com/gin-gonic/gin"
)

type Person struct {
	XMLName xml.Name `xml:"person"`
	FirstName string `xml:"firstName,attr"`
	LastName string `xml:"lastName,attr"`
}

func IndexHandler(c *gin.Context) {
	name := c.Params.ByName("name")
	surname := c.Params.ByName("surname")
	c.XML(200, Person{
		FirstName: name,
		LastName: surname,
	})
}

func main() {
	router := gin.Default()
	router.GET("/:name/:surname", IndexHandler)
	router.Run()
}