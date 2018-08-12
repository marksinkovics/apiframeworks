# Express project

__Official website:__ [expressjs](https://expressjs.com)

## Generate project

### Prerequisite

* __node.js__ should be installed  
(it is used during the sample project generation process)

### In a nutshhell

* mkdir `ExpressApp`
* cd `ExpressApp`
* `npm init`
	* package name: `expressapp`
	* entrypoint: `src/index.js`
* `npm install express --save` - install express framework directly for this project
* `mkdir src`
* `touch src/index.js` - create index.js file inside src folder
* `npm install nodemon --save-dev` - install nodemon directly for this project and it will be used only in development environment. It reloads page automatically after changes.
* open `package.json` and add `"start": "nodemon app.js"` under `scripts` key
* `npm install body-parser --save`
* `npm install express-basic-auth --save`
* `npm install underscore --save`