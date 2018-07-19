# halogen-boilerplate

This is a boilerplate for starting a real world project using the [purescript-halogen](https://github.com/slamdata/purescript-halogen) library for declarative user interfaces.

## Features

* [Bootstrap 4.1.2](http://getbootstrap.com/) is included.
* Update to latest  [purescript-halogen](https://github.com/slamdata/purescript-halogen) (only psc-package)
* [psc-package](https://github.com/purescript/psc-package) is included and it is default
* A rational structure of project with routing.
* [Webpack](https://github.com/webpack/webpack) is optional.

## Prerequisites

This guide assumes you already have Git and Node.js installed with `npm` somewhere on your path.

``` shell
npm install --global purescript pulp psc-package
```

## Getting started

First clone the repo and step into it:

``` shell
git clone https://github.com/jimmyhuco/halogen-boilerplate.git hello-halogen
cd hello-halogen
psc-package install
```

## Building

The project can now be built with:

``` shell
npm run build
```

This will build the PureScript source code and produce a bundled JS file as `dist/js/app.js`.


If you open `dist/index.html` you should now have a basic working Halogen app.

You can also use the command:

``` shell
npm run watch
```

To start a process that will watch the source files and trigger a reload whenever they are modified. Alternatively...

## Fast watching with `purs ide`

If you're using an editor that supports `purs ide`, there's an option for getting near-instant builds of the app while you work on it:

``` shell
npm install
npm run watch-fast
```

First, you should have to install [Webpack](https://github.com/webpack/webpack), and then it will start a watch process to rebundle the app whenever the _output_ files are changed. Since `purs ide` rebuilds modules on save, this means you can use this much faster bundle-only rebuild script.

## Note

* [purescript-halogen-bootstrap](https://github.com/slamdata/purescript-halogen-bootstrap) don't include bootstrap4, so I just add some "demo code" to use bootstrap4.
* Demo images are all from unsplash.com.
* I learned "watch-fast" from [purescript-halogen-template](https://github.com/slamdata/purescript-halogen-template)
* Thank you @snackycracky. He update purescript from 0.11.6 to 0.12.
