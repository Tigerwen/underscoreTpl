# grunt-underscoreTpl-build

> The best Grunt plugin ever.

## Getting Started
This plugin requires Grunt `~0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-underscoreTpl-build --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-underscoreTpl-build');
```

## The "underscoreTpl_build" task

### Overview
In your project's Gruntfile, add a section named `underscoreTpl_build` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  underscoreTpl_build: {
    options: {
      // Task-specific options go here.
    },
    dev: {
      options: {
        extname: ['.tpl','.string']
      },
      src: 'test',
      dest: 'tmp'
    }
  },
});
```

### Options

#### options.extname
Type: `Array`
Default value: `'.tpl'`
参与编译文件的后缀名


#### options.folderName
Type: `String`
Default value: `'tpl'`
参与编译文件夹的文件夹名称 统一


#### options.destExt
Type: `String`
Default value: `'-tpl.js'`
生成产物的拼接后缀名


### Usage Examples

#### Default Options
In this example, the default options are used to do something with whatever. So if the `testing` file has the content `Testing` and the `123` file had the content `1 2 3`, the generated result would be `Testing, 1 2 3.`

```js
grunt.initConfig({
  underscoreTpl_build: {
    options: {},
    dev: {
      options: {
        extname: ['.tpl','.string']
      },
      src: 'test',
      dest: 'tmp'
    },
  },
});
```

#### Custom Options
In this example, custom options are used to do something else with whatever else. So if the `testing` file has the content `Testing` and the `123` file had the content `1 2 3`, the generated result in this case would be `Testing: 1 2 3 !!!`

```js
grunt.initConfig({
  underscoreTpl_build: {
    dev: {
      options: {
        extname: ['.tpl','.string']
      },
      src: 'test',
      dest: 'tmp'
    }
  },
});
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
_(Nothing yet)_
