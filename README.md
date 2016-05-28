# web-form

[![NPM](https://img.shields.io/npm/v/web-form.svg?style=flat-square)](https://www.npmjs.com/package/web-form)
[![Downloads](https://img.shields.io/npm/dm/web-form.svg?style=flat-square)](http://npm-stat.com/charts.html?package=web-form)
[![Bower](https://img.shields.io/bower/v/web-form.svg?maxAge=2592000?style=flat-square)]()

web-form is a custom web form as a [riot-based](http://riotjs.com/) webcomponent, semantic-ui framework for design and fetch polyfill for web request and handle response thatn using an XMLHttpRequest. Please see all examples for more information.

This webcomponent can be used to validate information using ajax. For example, when it register new user, can verify if username or email already it was registered.

## Try online

[single input]()
[horizontal inputs]()
[vertical inputs]()
[mixed inputs]()

## Why [semantic-ui](semantic-ui.com) framework instead of boostrap or another css framework?

Because semantic-ui allows load only the components that you need via cnd. For example, web-form uses only form.min.css.

## Why [fetch polyfill](https://github.com/github/fetch) instead of jquery library?

Because jquery is a library with many features. web-form needs a library that work only with ajax, no more features.

## Install

```bash 
bower install web-form --save
```

```bash
npm install web-form --save 

// web-form does not compile from the server side. You must move web-form from node_modules to another static folder such as bower_component or public folder. 

// If web-form is compile from the server side, it will be generated only static html content.
```


## How to use for development (Browser)


```html
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <title>web-form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/components/form.min.css">
    
</head>
<body>

  <!-- put web-form tag anywhere inside the body tag -->
  <web-form></web-form>
  
  <script type="riot/tag" src="src/web-form.tag"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/riot/2.4.1/riot+compiler.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fetch/1.0.0/fetch.min.js"></script>
  
  <!-- mount web-form -->
  <script type="text/javascript">
    riot.mount('web-form', options);
  </script>
</body>
```

## Options

To customize web-form desing you should check out [semantic-ui forms](http://semantic-ui.com/collections/form.html));

- options: (Is an object)
 - checkbox: (Is an object)
   - show: Is a boolean. If true, checkbox is displayed on the webform
   - label: Is a string. A custom message next to checkbox
 - button: (Is an object)
   - class: Is a special class name used for customize the button. It's necesary when you use [semantic-ui botton](http://semantic-ui.com/elements/button.html).
   - label: Is a string. Specifies a name for the button
 - fetch: (Is an object). 
   - url: Is a string. Typically this is an absolute URL without the host component, e.g. "/api".
   - options: Is a object. 
     - method: Is a string. By default is get
     - For more options, please you should checkout out [options](https://github.github.io/fetch/)
 - inputs: Is an array that containt objects
     - class: Is a special class name used for customize the inputs. (e.g.: 'field', 'fields', 'two fields', 'three fields'. You should check out [semantic-ui forms](http://semantic-ui.com/collections/form.html)))
     - block: Is an array that containt objects. Each objects is an input. If you specifies 3 objects there are 3 inputs. (See the examples for customize inputs)
         - class: Is a special class name used for determine the wide of the input. (e.g.: 'two wide', 'three wide', 'six wide', etc you should check out [semantic-ui forms](http://semantic-ui.com/collections/form.html)))
         - label: Is a string that defines a label for the <input> tag
         - name: Is a string that defines a name for the <input> tag
         - placeholder: Is a string that defines a placeholder for the <input> tag
         - type: Is a string that defines a type for the <input> tag ('text', 'password', etc)
         - api: (Not obligatory) Is a boolean. You should specified this value to true if you want to make request via ajax.
         

## Create a bundle file

a) execute

```bash
npm run build
```
b) add link script for bundle file 

```html
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <title>web-form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/components/form.min.css">
    
</head>
<body>

  
  <web-form></web-form>
  <!-- put link script  -->
  <script type="text/javascript" src="dust/bundle.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fetch/1.0.0/fetch.min.js"></script>
  
  <!-- mount web-form -->
  <script type="text/javascript">
    riot.mount('web-form', options);
  </script>
</body>
```

  
## Examples

You should please check out the examples online

## Support

If you need help using web-form, or have found a bug, please create an issue on the Github repo

## License

[MIT License]()
