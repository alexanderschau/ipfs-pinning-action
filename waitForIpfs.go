package main

import (
	"net/http"
	"net/url"
	"time"
)

func main() {
	status := 0
	for status != 200 {
		resp, err := http.PostForm("http://127.0.0.1:5001/api/v0/id", url.Values{})
		if err == nil {
			status = resp.StatusCode
		}
		time.Sleep(time.Second)
	}
}
