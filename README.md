# Time Tracker

## Contribute
0. Fork this repository on GitHub
0. Clone your fork
0. Run `bower install && npm install` to install dependencies
0. Run `grunt serve` to start a server with LiveReload
0. You're ready to code!

## What you need to know
### AngularJS
### Firebase
### [Yeoman](http://yeoman.io) for scaffolding
`generator-angular` has already been installed in this project. We did not use `generator-angularfire` because it's not (yet) available in Coffeescript.

#### Use generator-angular subgenerators
0. Generate controller and view with `yo angular:route <myroute> --coffee` (this adds *myroute* to `app/scripts/app.coffee`, `app/scripts/controllers/<myroute>.coffee`, `app/views/<myroute>.html`)
0. See [the official docs](https://github.com/yeoman/generator-angular) for more subgenerators


#### Add another generator to the project:
0. Install the generator with `npm install -g generator-<name>`
0. `cd` into the project's root directory and run `yo <name>`

### [Bower](http://bower.io) for dependency management
0. `bower search <dependency>` searches the Bower registry for *dependency*
0. `bower list` lists current dependencies
0. `bower update <dependency>` updates *dependency*
0. `bower install <dependency1>..<dependencyN> --save` downloads and installs specified dependencies, and updates `bower.json` (specified by the flag `--save`)
0. `bower uninstall <dependency1>..<dependencyN> --save`

### [Grunt](http://gruntjs.com) for building, previewing, testing

0. `grunt serve` to preview project on Chrome with LiveReload
0. `grunt test` to run unit tests
0. `grunt` to build

## Links
0. See the project's [trello](http://trello.com) boards for development plans, bugs, and ideas.