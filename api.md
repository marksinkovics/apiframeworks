# API description

This list contains all features in order which would be implemented in all frameworks.

## Implementation steps
1. [ ] Basic api with versioning
	* URL: `GET :8080/api/1/user`

2. [ ] Router parameter handling
	* URL: `GET :5000/api/1/user/:id`

3. [ ] Basic json middleware
	* URL: `GET :5000/api/1/user`  
	* Headers:
		* `Content-Type: application/json`

4. [ ] Handle alter requests (PUT, POST, DELETE)
	* URL: `PUT :5000/api/1/user`
		* Body: `{"name": "John"}`
	* POST: `POST :5000/api/1/user`
		* Body: `{"name": "John"}`
	* DELETE: `DELETE :5000/api/1/user/:id`

5. [ ] Handle basic authentication  
	* URL: `GET :5000/admin`  
	* Headers: `Authorization: Basic dXNlcjpwYXNzd29yZA==`